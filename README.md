# LPC43xx Example Project: Blinky

Simple Hello World-like blinky programs for the LPC43xx platform.
This repositories contains three blinky programs, in increasing order of complexity / abstraction level:

1. ~~bare-metal~~ (**TODO: not implemented yet**): A blinky program in one file, with no dependencies at all
2. ~~basic~~ (**TODO: not implemented yet**): Some of the low-level stuff is in separate functions, but still a very simple c program
3. [cpm](/cpm/): Using CPM as c package manager: reuseable dependencies are in separate repositories

This projects assumes our specific breakout board for the LPC43xx chip, however it is easily adapted to different board configurations, as the project only uses one GPIO pin to blink a LED.
