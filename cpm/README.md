# CPM-based blinky project: lpc43xx (m4 core)

Simple Blinky program for the LPC4337 using CPM chip libraries.

This projects assumes a lpc4337-based [lpc4330-xplorer board](https://www.nxp.com/support/developer-resources/nxp-designs/lpc4330-xplorer-board:OM13027), however it is easily adapted to different board configurations.

**NOTE:** this project assumes a **flash-based** lpc43xx microcontroller, such as the lpc4337. (there are also *flashless* lpc43xx microcontrollers that don't have internal flash memory).


## How To Use

### Prerequisites

- [Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)
- [OpenOCD](http://openocd.org)
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

This assumes you have openocd installed.

run this from the build dir, see build step
```
make flash
```

If everything went right, the firmware should be running and blinking some LEDS.
