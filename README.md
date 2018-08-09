# example_blinky_m4

Simple Hello World like blinky program for the LPC43xx platform as a CPM package

## How To Use

### Build the firmware:
```
mkdir build
cd build
cmake ..
make
```

### Flash the firware to a board

This assumes you have openocd installed.

Also, note that this project assumes a bootloader is used (see the bootloader43xx_sdcard for example).
To use this firmware directly without any bootloader, simply edit link.ld and CMakeLists.txt and replace `
0x1A008000` with `0x1A000000` (this is the address in flash where the firmware is placed).
```
# NOTE: run this from the build dir, see previous step
make flash
```
If everything went right, the firmware should be running and blinking some LEDS.
