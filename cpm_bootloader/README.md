# CPM-based blinky project: lpc43xx (m4 core, using bootloader)

Simple Blinky program for the LPC4337 using CPM chip libraries.

This projects assumes our specific breakout board for the LPC4337 chip, however it is easily adapted to different board configurations.

![](board.jpg)
## How To Use

### Prerequisites

- [Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)
- [OpenOCD](http://openocd.org)
- CMake

These need to be installed and available in your PATH.

### Build the firmware:

Clone the project, and inside the project folder do:
```
mkdir build
cd build
cmake ..
make
```

### Flash the firware to your board

This assumes you have openocd installed.

Also, note that this project assumes a bootloader is used (see the bootloader43xx_sdcard for example).
To use this firmware directly without any bootloader, simply edit link.ld and CMakeLists.txt and replace `
0x1A008000` with `0x1A000000` (this is the address in flash where the firmware is placed).

run this from the build dir, see build step
```
make flash
```

If everything went right, the firmware should be running and blinking some LEDS.
