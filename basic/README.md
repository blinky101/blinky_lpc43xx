# Basic blinky project

## How To Use

### Prerequisites

- [Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)
- A [Black Magic Probe](https://github.com/blacksphere/blackmagic/wiki)
- make

Make sure all required software is installed correctly and available in your PATH.

### Build the firmware:

Clone the project, go to the basic project folder and build it:
```
git clone https://github.com/blinky101/blinky_lpc43xx.git
cd blinky_lpc43xx/basic
make all
```

### Flash the firware to your board

This step flashes the firmware via the [Black Magic Probe](https://github.com/blacksphere/blackmagic/wiki). Flashing via OpenOCD is also possible, but is not covered in this documentation.

```
arm-none-eabi-gdb -nx --batch \
-ex 'target extended-remote /dev/ttyACM0' \
-ex 'monitor swdp_scan' \
-ex 'attach 1' \
-ex 'load' \
-ex 'set mem inaccessible-by-default off' \
-ex 'compare-sections' \
-ex 'kill' \
blinky.elf
```
The output will look similar to this:
```
Loading section .text, size 0x448 lma 0x1a000000
Start address 0x1a000228, load size 1096
Transfer rate: 3 KB/sec, 548 bytes/write.
Section .text, range 0x1a000000 -- 0x1a000448: matched.
Kill the program being debugged? (y or n) [answered Y; input not from terminal]

```

### Debugging via gdb

This works similarly to flashing.
Connect your debugger to the target board, and run the following command:
```
arm-none-eabi-gdb \
-ex 'target extended-remote /dev/ttyACM0' \
-ex 'monitor swdp_scan' \
-ex 'attach 1' \
-ex 'set mem inaccessible-by-default off' \
blinky.elf
```
This should drop you into a gdb console.


## FAQ

### Why does the Black Magic Probe not work? How do I find the correct /dev/tty* file?

Try plugging the black Magic Probe in and out and observing the differences in /dev/. On linux, /dev/ttyACM0 or similar is expected, on MacOS it will look like /dev/cu.<serial_number>.

### How does the code work?

The basic project should be easier to read than [bare-metal](/bare-metal),
but all the source files (especially in the *chip* directory) might be overwhelming.
The most important thing to understand is that the code begins in 'startup.c',
which looks a bit similar to the bare-metal project.
The startup code does some initialization and then calls main()

