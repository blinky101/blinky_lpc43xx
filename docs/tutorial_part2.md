---
title: Tutorial Part 2
---

# Tutorial Part 2: The Basics

The previous tutorial showed how to get a bare-metal blinky up and running.
This part will show an expanded version, which adds some abstractions to make the main program a bit easier to work with.

> **Note: If you have skipped [part 1](./tutorial_part1), you can [download the code from here](https://github.com/blinky101/blinky_lpc43xx/tree/master/bare-metal/).**

## This is not a c program (yet)

[The end result from part 1](https://github.com/blinky101/blinky_lpc43xx/tree/master/bare-metal/) of the tutorial almost looks like a normal c program, but there are still some bits missing.
C is considered a low-level language by most people, but even c needs some special setup to be completed before it can run properly.

We still need to: 

1. store global variables in flash memory
2. copy non-constant globals from flash to ram before the `main()` program runs
3. set all uninitialized global variables to zero before `main()` runs
4. create a `main()` function that blinks the leds with a nice api

See the [lpc11uxx tutorial](../blinky_lpc11uxx/tutorial_part2) for a more in-depth explanation of how this is done, it is basically the same for the lpc43xx.

## The linker script

Step 1 is solved by adding some sections in the linker script:

```
/* data section: initialized global variables */
.data : ALIGN(4)
{
   FILL(0xff)
   _data = . ;
   *(.data*)
   . = ALIGN(4) ;
   _edata = . ;
} > RAM AT>Flash

/* bss section: global variables initialize to zero */
.bss : ALIGN(4)
{
    _bss = .;
    *(.bss*)
    *(COMMON)
    . = ALIGN(4) ;
    _ebss = .;
    PROVIDE(end = .);
} > RAM
```
The bss section just declares some space in RAM, the data section is both in flash and in RAM.

To initialize the `.data` and `.bss` sections, we must know where they are in memory, how large they are and where to get the data. To get this information available in the main program, we will change the `.text` section to include a so-called *Global Section Table*. This contains:
* a data_section_table: a table with one entry: the properties of the `.data` section
* a bss_section_table: another table with one entry: the properties of the `.bss` section

After adding the section table, the *.text* section looks like this:

```
.text : ALIGN(4)
    {
        FILL(0xff)
        KEEP(*(.interrupt_vector_table))

        /* Global Section Table */
        . = ALIGN(4) ;
        __section_table_start = .;
        __data_section_table = .;
        LONG(LOADADDR(.data));
        LONG(    ADDR(.data));
        LONG(  SIZEOF(.data));
        __data_section_table_end = .;
        __bss_section_table = .;
        LONG(    ADDR(.bss));
        LONG(  SIZEOF(.bss));
        __bss_section_table_end = .;
        __section_table_end = . ;
        /* End of Global Section Table */

         *(.text*)

    } > Flash
```

## The startup code

Because setting up the data section is one of the first things to do at startup, we will call it the *startup code*.
To initialize the data section, we write a simple function to copy data from flash to RAM (The `i+=4` part is because len will be supplied in bytes, while the pointers are 32-bit = 4 bytes in size):

```
void data_init(unsigned int romstart, unsigned int start, unsigned int len)
{
    unsigned int *dst = (unsigned int *) start;
    unsigned int *src = (unsigned int *) romstart;
    unsigned int i;
    for (i = 0; i < len; i+=4) {
        *dst++ = *src++;
    }
}
```

We have to keep it simple: the startup code cannot rely on features that need the startup code to be finished! The function to initialize bss is even simpler:
```
void bss_init(unsigned int start, unsigned int len)
{
    unsigned int *dst = (unsigned int *) start;
    unsigned int i;
    for (i = 0; i < len; i+=4) {
        *dst++ = 0;
    }
}
```

To call these functions, we first need access to the *Data Section Table* from the linker script. Add the following lines to the top of main.c:
```
extern unsigned int __data_section_table;
extern unsigned int __data_section_table_end;
extern unsigned int __bss_section_table;
extern unsigned int __bss_section_table_end;
```

Then we add the logic to call data_init and bss_init:
```
void prepare_startup(void)
{
    unsigned int load_addr, exe_addr, section_len;
    unsigned int *section_table_addr;

    // Load base address of Global Section Table
    section_table_addr = &__data_section_table;

    // Copy the data sections from flash to SRAM.
    while (section_table_addr < &__data_section_table_end) {
        load_addr = *section_table_addr++;
        exe_addr = *section_table_addr++;
        section_len = *section_table_addr++;
        data_init(load_addr, exe_addr, section_len);
    }
    // At this point, section_table_addr = &__bss_section_table;
    // Zero fill the bss segment
    while (section_table_addr < &__bss_section_table_end) {
        exe_addr = *section_table_addr++;
        section_len = *section_table_addr++;
        bss_init(exe_addr, section_len);
    }
}
```

When you call `prepare_startup()` at the beginning of the program, the code should work. Try experimenting by changing the program, adding global variabes etc.

## Refactoring: startup code

While it is good to know that startup code is required and how it works, you almost never need to change it and will share it across many projects. A common way to do this is to put all the startup-related code in a separate file, then calling `main()` at the end of the startup code. `main` can then be implemented to do the normal tasks for your projects, such as blinking LEDs without worrying about setting up the c runtime requirements.

See [the repository for this project](https://github.com/blinky101/blinky_lpc43xx/tree/master/basic/) for an example.


## Refactoring: chip library

Now that we finaly have a sane c environment, a good next step would be to refactor the blinky logic itself. After all, who likes looking up memory addresses for every peripheral? Especially the lpc43xx platform has a lot of peripherals and features, some of which can be fairly complex to setup. We can make the code a lot more readable by intruduce header files which define some structs and constants with names that closely match the names in the datasheet. Fortunately, these header files are already available.

This already simplifies toggling a LED:
```diff
- (*(volatile unsigned int *)(0x400F6204)) = (1 << 12);
+ LPC_GPIO_PORT->SET[1] |= (1 << 12)
```

On top of that, you could write some wrapper functions / macros to make it even nicer:
```diff
- LPC_GPIO_PORT->SET[1] |= (1 << 12)
+ chip_gpio_set(1,12);
```
Have a look at [the 'basic' project from the repository](https://github.com/blinky101/blinky_lpc43xx/tree/master/basic/) to see the end result: main.c contains just the blinky logic, startup.c contains all the startup stuff and the other files form a very basic chip library.

<div class="tutorial_nav">
  <a class="left" href="./tutorial_part1">◀ Tutorial Part 1</a>
  <a class="right" href="./tutorial_part3">Tutorial Part 3 ▶</a>
</div>
