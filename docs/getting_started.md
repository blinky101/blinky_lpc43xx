---
title: Getting Started
---

# Getting Started

This guide helps you setup and test your development board and tools.

## Connecting the wires
<img src="img/xplorer_with_bmp.jpg" alt="Lpc4330-xplorer board connected to a Black Magic Probe">


The way to connect depends on the board. For now, we assume the [lpc4330-xplorer board](https://www.nxp.com/support/developer-resources/nxp-designs/lpc4330-xplorer-board:OM13027) **NOTE:** while it is called lpc4330-xplorer, our board has a lpc4337 chip. This guide assumes a **flash-based** lpc43xx microcontroller, such as the lpc4337. (there are also *flashless* lpc43xx microcontrollers that don't have internal flash memory).

## Testing Your Setup

Depending on your platform, a 'file' in /dev/ is created when you plugin the Black Magic Probe.

The name of this file can change sometimes, but it is relatively easy to find out by plugging the Black Magic Probe in and out and observing the differences.

* Linux: the file will be something like `/dev/ttyACM0`.

  Depending on the linux distribution, you may need permissions to use the debugger. On Ubuntu, this can be fixed by adding yourself to the `dialout` group. Don't forget to logout and login for the changes to take effect.
  ```
  sudo adduser <your-username> dialout
  ```
* Mac: the file will be formatted like `/dev/cu.usbmodemXXXXXXX1` (hint: you can find it with `ls /dev/cu.usbmodem*1`)

You can test if the Black Magic Probe correctly detects the board:

```
arm-none-eabi-gdb -nx --batch \
-ex 'target extended-remote /dev/ttyACM0' \
-ex 'monitor swdp_scan'
```
This should result in something like this:
```
Target voltage: 3.3V
Available Targets:
No. Att Driver
 1      LPC43xx
```
If the command above failed, make sure your target board has power. A nice feature of the official Black Magic Probe is that it can provide 3.3V to the target board. So if your board is compatible with 3.3V, try this (note the 'monitor tpwr enable' line):
**NOTE: When enabling power-via-jtag, make sure your board is 3.3V compatible and is not powered by another supply (e.g. via USB cable)**
```
arm-none-eabi-gdb -nx --batch \
-ex 'target extended-remote /dev/ttyACM0' \
-ex 'monitor tpwr enable' \
-ex 'monitor swdp_scan'
```


## Blinking the LED

Download the [pre-compiled blinky program *blinky.elf*](https://github.com/blinky101/blinky_lpc43xx/tree/master/bare-metal/blinky.elf) (or you can [clone](https://github.com/blinky101/blinky_lpc43xx) the repository and build it yourself)

The blinky progam can be flashed using this command, replacing /dev/ttyACM0 with the correct file for your setup:
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
Loading section .text, size 0x180 lma 0x1a000000
Start address 0x1a000114, load size 384
Transfer rate: 1 KB/sec, 384 bytes/write.
Section .text, range 0x1a000000 -- 0x1a000180: matched.
Kill the program being debugged? (y or n) [answered Y; input not from terminal]

```

If all goes well, you have succesfully uploaded your first program!
You should now see a blinking LED (assuming your board has an LED attached to pin P2_12).
<img src="img/xplorer_blink.jpg" alt="A blinking led" width="600">

<div class="tutorial_nav">
  <a class="left" href="./">◀ Blinky LPC43xx</a>
  <a class="right" href="./tutorial_part1">Tutorial Part 1 ▶</a>
</div>



