---
title: Tutorial Part 1
---

# Tutorial blinky lpc43xx

This tutorials shows you how to create a blinky project for the lpc4337 microcontroller from scratch without any software dependencies. This tutorial should work for all flash-based lpc43xx parts.

In this tutorial we will learn about

* Pin multiplexing
* Pin vs GPIO numbers
* Peripheral registers for gpio
* Interrupt vector table
* Linker file

## Step 0: Requirements

* GNU Arm Embedded Toolchain
* Black Magic Probe for flashing the firmware

<!-- See [link] for installation instructions -->

## Step 1: Create your project

Create a directory

```
mkdir blinky_lpc43xx
cd blinky_lpc43xx
```

To start we will need 2 files. the code will reside in `main.c` and `link.ld` will be needed by the linker for building the binaries.

```
touch main.c link.ld
```
This will create the (empty) files in the required directory.

## Step 2: Writing the code

Remember, our goal, and our only goal is to blink the LED on pin P2_12. Toggling a pin is done through the GPIO perihperal. But first we need to make sure that the pin is available for the GPIO peripheral. This is usually called pin multiplexing. The more complex a microcontroller is, the more functions are available per pin.


### Pin multiplexing

We will need information from the [manual (UM10503)](https://www.nxp.com/docs/en/user-guide/UM10503.pdf). In `Chapter 17 System Control Unit / IO Configuration` we can find the relevant information. More specifically section `17.4 table 190` shows the adresses of the pins, `17.4.1 table 191` shows the settings that are applicable to pin P2_12.
The first 3 bits `2:0 FUNC` determine the selected function of the pin. The available options for each pin are listed in `Chapter 17.3.11 table 189` (see also `Chapter 16.2.3 table 187`):

* `0x0: GPIO1[12]` - use the pin as GPIO 1_12. This is what we need.
* `0x1: CTOUT_4` - SCT peripheral: output 4
* `0x2: R` - Reserved
* `0x3: EMC_A3` - External memory peripheral: address line 3.
* `0x4: R` - Reserved
* `0x5: R` - Reserved
* `0x6: R` - Reserved
* `0x7: U2_UCLK` - USART2 peripheral: clock (for synchronous mode).

The other fields of this register we can ignore for now. Because we want the pin to be a GPIO pin, we need to write `0b00` to the first 2 bits of the register. The manual shows that the `P2_12 register` is located at memory address `0x4008 6130`.
This results in our first line of c code:

```
// configure P2_12 pin function as GPIO1[12]
(*(volatile unsigned int *)(0x40086130)) = 0;
```
What this does: First we cast the address to an *int pointer*: `(volatile unsigned int *)(0x40086130)`. Then we dereference it and write a zero to the memory location `0x4008 6130` (which is not actually memory: it is a specific IO configuration register, which is memory-mapped at that address).

*Note that it is not very good practice to write (anything) to reserved register values, since it can have unintended side effects, but in this case it is harmless. The better way is to first read the value, then only set or clear the bits you want to change and then write the value back.*


### Translating pin numbers to GPIO numbers

As you may have noticed in the previous section, pin `P2_12` is configured as GPIO `1_12`. On simpler platforms such as the [lpc11uxx](../blinky_lpc11uxx), the pin and GPIO numbers are usually the same. On this chip however, the GPIO numbers are different from the pin numbers (which are different from the physical footprint pin numbers). Two similar GPIO numbers may map to completely different pin numbers! To avoid confusing, we always prefix **P**in numbers with a **P**.


### GPIO configuration

Now that the pin belongs to the GPIO peripheral, we can configure it as an output pin.

**TODO register offset for port 1**
This is done using the `GPIO port direction registers` located at address `0x400F 6000` (see `chapter 19.5.3.3` of the manual). We are going to set GPIO `1_1`, which means pin 1 on port 1, so we need the DOR register for port 1 at `0x400F 6004`. This 32-bit register defines a `DIR`-bit for every pin in GPIO Port 1. So, bit 0 corresponds with GPIO `1_0`, bit 1 with GPIO `1_1`, etc. Thus we need to set bit 12 to control the direction of GPIO `1_12`. Our second line of code is

```
// configure GPIO direction
(*(volatile unsigned int *)(0x400F6004)) |= (1 << 12);
```


### Toggling the pin high and low

Now that we did all the preparations we can finally do do the real blinking. We need to toggle the pin between a high state (3.3V) and a low state (0V). There are multiple ways to do this, but for this tutorial we will use the `GPIO port set` and `GPIO port clear` registers. See sections `19.5.3.7` and `19.5.3.8` of the manual. Similarly to the GPIO direction register, we should now write to the 12th bit of the CLEAR and SET registers for port 1:

```
// set LED GPIO low
(*(volatile unsigned int *)(0x400F6284)) = (1 << 12);


// set LED GPIO high
(*(volatile unsigned int *)(0x400F6204)) = (1 << 12);
```

Don't forget to add some delay `for (int i = 0; i < 100000; ++i) __asm__("nop");`so that our slow human eyes can actually see the blinking. The delay is just a for loop that does noting (`__asm__("nop")` is the assembly nop operator, which means no-operation) during 100000 loops

And finally we wrap it in a `while(1)` loop so that it will go on forever:

```
while(1) {

    // set LED GPIO low
    (*(volatile unsigned int *)(0x400F6284)) = (1 << 12);
    for (int i = 0; i < 100000; ++i) __asm__("nop");

    // set LED GPIO high
    (*(volatile unsigned int *)(0x400F6204)) = (1 << 12);
    for (int i = 0; i < 100000; ++i) __asm__("nop");
}
```

Putting all our code inside a function `blinky()` in the main.c file:

```
void blinky(void)
{
    // configure P2_12 pin function as GPIO1[12]
    (*(volatile unsigned int *)(0x40086130)) = 0;

    // configure GPIO direction
    (*(volatile unsigned int *)(0x400F6004)) |= (1 << 12);

    while(1) {

        // set LED GPIO low
        (*(volatile unsigned int *)(0x400F6284)) = (1 << 12);
        for (int i = 0; i < 100000; ++i) __asm__("nop");

        // set LED GPIO high
        (*(volatile unsigned int *)(0x400F6204)) = (1 << 12);
        for (int i = 0; i < 100000; ++i) __asm__("nop");
    }
}
```

Now we can try to compile it with the following command:

```
arm-none-eabi-gcc -Wall -Wextra -g3 -O0 -MD -mcpu=cortex-m4 -mthumb -c -o main.o main.c
```
If everything went OK we didn't get any warning or errors and now we have a `main.o` object file in our directory. Unfortunately, we're not quite ready to run this code on our hardware.

We still need to tell the compiler and our microcontroller where to place the code and where to find it. That's where the `link.ld` file we created earlier comes into play.

## Step 3: Linker File and Interrupt Vector Table

[General intro to linkerfile?]

The linker file basically does two things. Define the available memory, and define what should be put into it.

For this project, the minimum viable linker file is as follows

```

MEMORY
{
  /* common memory layout for all flash-based 43xx parts */
  Flash (rx) : ORIGIN = 0x1a000000, LENGTH = 0x40000 /* 256kB */
  RAM (rwx) : ORIGIN = 0x10080000, LENGTH = 0xA000 /* 40kB */
}

/* Define a symbol for the top of each memory region */
__top_RAM = ORIGIN(RAM) + LENGTH(RAM);

/* reset_vector is the entry point of the program */
ENTRY(blinky)

SECTIONS
{
    .text : ALIGN(4)
    {
        FILL(0xff)
        KEEP(*(.interrupt_vector_table))
         *(.text*)

    } > Flash


    /* Pointer to top of the stack */
    PROVIDE(_vStackTop = __top_RAM - 0);

    /* Calculate the usercode checksum as per the LPC43xx user manual:
     * UM10503, chapter 6.4.4.1 "Criterion for Valid User Code".
     */
    PROVIDE(__valid_user_code_checksum = 0 -
        (_vStackTop
        + (blinky + 1)
        + (0)
        + (0)
        + (0)
        + (0)
        + (0)
        )
    );
}


```
We can just copy this to `link.ld`.

#### Memory section

The linker file starts with a memory section. This section defines all the memory available, which for the flash-based LPC43xx is Flash and RAM. If we take a look at the memory map in chapter 3.5 of the manual, we see that there is on-chip flash starting at address `0x1a00 0000` which has a size of at least 256 kB (depending on the exact model, the lpc4337 has the most: 2x512 kB). Additionally, there are multiple blocks of RAM. For now, we only use the 40kB of RAM located at address `0x1008 0000`.

```
MEMORY
{
  /* common memory layout for all flash-based 43xx parts */
  Flash (rx) : ORIGIN = 0x1a000000, LENGTH = 0x40000 /* 256kB */
  RAM (rwx) : ORIGIN = 0x10080000, LENGTH = 0xA000 /* 40kB */
}
```

#### Sections section

The rest of the linker file, which consists mostly of the `SECTIONS` section, tells the compiler where the code needs to be and where the Interrupt vector table should be.

#### Interrupt Vector Table

Finally we need to add this code to `main.c`. The special compiler attribute `__attribute__ ((section(".interrupt_vector_table")))` makes sure that the following `interrupt_vector_table` struct will be placed at the correct memory address as defined in the linker file.
This table is defined by the Cortex-M4 architecture. It will always start with the stack pointer followed by the reset interrupt vector. We have pointed the `.reset` to our blinky function so that the microcontroller will start code execution there.


```
// these symbols are defined in the linker script
extern unsigned int __valid_user_code_checksum;
extern unsigned int _vStackTop;

// setup the interrupt vector table
__attribute__ ((section(".interrupt_vector_table")))
struct {
    void *stack;
    void (*reset)(void);
    void *_unused_m4[5];
    unsigned int checksum;
    void *__unused_m4[8];
    void *__unused_chip[53];
} interrupt_vector_table = {

    .stack = &_vStackTop,
    .reset = blinky,
    .checksum =  (unsigned int)&__valid_user_code_checksum,
};
```

#### Checksum

The checksum is a special LPC feature which is used by the onboard LPC bootloader to determine whether a valid program exists in flash memory: if the checksum does not match, the bootloader will refuse to start our program. The linker file calculates the correct value and the interrupt vector table makes sure it is placed at the correct location. See chapter `6.4.4.1` of the user manual.


## Compile and link and flash

Now we have everything to run our code. Issue the following commands to compile and link our code respectively.

```
arm-none-eabi-gcc -Wall -Wextra -g3 -O0 -MD -mcpu=cortex-m4 -mthumb -c -o main.o main.c
arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -nostartfiles -Wl,-T,link.ld -o blinky.elf main.o -lc -lnosys
```

After this we should have a `blinky.elf` file. We can flash our code to the board using the Black Magic Probe:

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

<!--  See [TODO] for more detailed information about flashing your target board. -->

> **Note: The completed project can be downloaded from the [blinky_lpc43xx repository](https://github.com/blinky101/blinky_lpc43xx/tree/master/bare-metal/).**


<div class="tutorial_nav">
  <a class="left" href="./getting_started">◀ Getting Started</a>
  <a class="right" href="./tutorial_part2">Tutorial Part 2 ▶</a>
</div>

