# LPC43xx series

<img src="img/lpc11uxx.jpg" alt="LPC43xx microcontroller chip" width="200">

The LPC43xx microcontrollers are fairly advanced 32 bit dual-core microcontrollers. They have a cortex-m4 as well as a cortex-m0 cpu, both running at up to 204MHz. This platform has lots of peripherals, such as integrated high-speed USB 2.0, SGPIO, etc. If you just want do perform simple tasks, the [LPC11uxx](../lpc11uxx) may be a more suitable solution: it is cheaper and more suitable for beginners.

The purpose of this guide is to document the steps required to get started on this platform from scratch, using just a few open-source tools.

## What do you need

* A PCB with an LPC43xx microcontroller, an LED and a JTAG/SWD connector. You can build one yourself, but if you want to get started quickly, we recommend getting a development board.

* Debugging hardware to get your code on the microcontroller. We advise the [Black Magic Probe](https://github.com/blacksphere/blackmagic/wiki), as it is easy to work with and requires no software dependencies (just gdb). The Black Magic Probe itself is open source, sou you could build one yourself if you want to.

* A computer with some free USB ports. This guide assumes you are running linux or MacOS.

* [Gnu Arm Embedded Toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads): this is a set of open-source tools including the gcc compiler and gdb debugger, specialized for embedded Arm cortex processors.


## Tutorials

Build your own blinky project from scratch and understand what is happening with the help of our tutorial.
**NOTE: tutorials are under construction and will appear soon**

* ~~[Part 0: Getting Started](./getting_started)~~
* ~~[Part 1: Bare-metal Blinky](./tutorial_part1)~~
* ~~[Part 2: Basic Blinky](./tutorial_part2)~~
* ~~[Part 3: CPM Blinky](./tutorial_part3)~~
