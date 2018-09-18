# LPC43xx Example Project: Blinky

Simple Hello World-like blinky programs for the LPC43xx platform.
This repositories contains three blinky programs, in increasing order of complexity / abstraction level:

1. [bare-metal](/bare-metal): A blinky program in one file, with no dependencies at all.
2. [basic](/basic): A proper but very basic c program, where the low-level stuff is in separate functions.
3. [cpm](/cpm/): Using CPM as c package manager: reuseable dependencies are in separate repositories.
3. [cpm_bootloader](/cpm_bootloader/): Same as [cpm](/cpm/), but used in combination with a custom bootloader.

See [the blinky website](https://blinky101.github.io/blinky_lpc43xx/) and the per-project *README* files for more information.
