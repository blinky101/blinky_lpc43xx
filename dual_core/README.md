# CPM-based blinky project: lpc43xx (dual core)

Dual core blinky program for the LPC4337 using CPM chip libraries.
A program running on the cortex-M4 core blinks one LED, while the cortex-M0 independently blinks another LED.

This projects assumes a lpc4337-based [lpc4330-xplorer board](https://www.nxp.com/support/developer-resources/nxp-designs/lpc4330-xplorer-board:OM13027), however it is easily adapted to different board configurations.

**NOTE:** this project assumes a **flash-based** lpc43xx microcontroller, such as the lpc4337. (there are also *flashless* lpc43xx microcontrollers that don't have internal flash memory).


## How To Use

### Prerequisites

- [Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)
- A [Black Magic Probe](https://github.com/blacksphere/blackmagic/wiki) or [OpenOCD](http://openocd.org) in combination with a [JTAG LockPick tiny 2](http://www.distortec.com/jtag-lock-pick-tiny-2/) 
- CMake

These need to be installed and available in your PATH.

### Build the firmware:

Clone the project, and inside the project folder do:
```
cp config.cmake.example config.cmake
# review the settings in config.cmake

mkdir build
cd build
cmake ..
make
```

### Flash the firware to your board

This assumes you have a [Black Magic Probe](https://github.com/blacksphere/blackmagic/wiki) connected, or [OpenOCD](http://openocd.org) installed and the [LockPick tiny 2](http://www.distortec.com/jtag-lock-pick-tiny-2/) connected.

run this from the build dir, see build step
```
make flash
```

If everything went right, the firmware should be running and blinking some LEDS.

## FAQ

### Where are the dependencies? How does this work?

This project uses the CPM package manager, which is basically a few lines of CMake logic.
The CMakeLists.txt contains a list of dependencies, which are automatically checked out.
After building the firmware, all dependencies are found in build/cpm_packages/modules/


### Why does the Black Magic Probe not work? Why is OpenOCD tried instead?

The script automatically tries to connect to the Black Magic Probe. If it cannot be found, it falls back to OpenOCD.
If the firmware tries to flash via OpenOCD, it means that your probe is not detected properly.
You can specify the Black Magic Probe in config.cmake:
```
cp config.cmake.example config.cmake

# edit this line to match your Black Magic Device
set(BLACKMAGIC_DEV /dev/ttyBmpGdb)
```

