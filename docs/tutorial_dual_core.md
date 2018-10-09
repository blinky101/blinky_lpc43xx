---
title: Tutorial: dual core blinky
---

# Dual core: booting the cortex-M0

The lpc43xx is a dual-core microcontroller, with a cortex-M0 as well as a cortex-M4 processor.
We'll simply call them 'M0' and 'M4'. When the microcontroller is powered up, the M4 starts running, while the M0 is powered down.

So by default the part behaves just like a single-core cortex-M4. This is how we used it in the [blinky tutorial](./getting_started) so far.

## Shared Memory Map

To understand the way the M0 core interacts with the system, it is important to understand that both cores share the same memory map.
This means that both cores can access basically all flash memory, all SRAM and all peripheral registers.

This gives code on the M0 a lot of freedom: it can do anything the M4 can do. For example, the M0 core could run peripheral drivers (for example for UART, SPI, USB etc)
and communicate with the M4 core over shared memory.

However, there is also a downside: we have to be very carefull to plan in advance which resources will belong to which core.
An obvious example is memory corruption: we don't want the M0 to accidentally write to memory the M4 was using.
This is a potential cause for very nasty bugs that can be frustrating and time consuming to debug.

### Planning the memory layout

Each core needs at least some space in flash memory (to store the code) and a bit of RAM to store variables.
How much flash or RAM does each core have? The answer is that we are free to choose this ourselves!
In the example below, we assign 32Kb to the M0 core and 40Kb to the M4, but you could divide it any way you like.

```
MEMORY
{
  /* Define each memory region */
  Flash_M0 (rx) : 	ORIGIN = 0x1b000000, LENGTH = 0x80000
  Flash_M4 (rx) : 	ORIGIN = 0x1a000000, LENGTH = 0x80000
  RAM_M0 (rwx) : 	ORIGIN = 0x10000000, LENGTH = 0x8000
  RAM_M4 (rwx) : 	ORIGIN = 0x10080000, LENGTH = 0xA000
}
```
For the flash memory, we have opted to run the M4 from flash bank A and M0 from bank B.
You could also run both programs from a different offset in the same flash bank, but this might slow things down.

## Two firmwares on one chip

The easiest way to reason about a dual core firmware is to see it as two separate firmwares that happen to run on the same chip.
Both firmwares have their own startup code, their own `main()` etc.

This is exactly how we are going to do it: we will compile a cortex-M0 firmware and flash it to address `0x1b000000`, while flashing the M4 firmware to flash address `0x1a000000`.
Of course, the M0 program should be linked to only use the `RAM_M0` part of the memory, while the M4 firmware should use the ram at `RAM_M4`.

## Enabling the M0 core

Imagine we have created both firmwares and flashed them to the microcontroller. But how do we start the M0 core?
This is done by the M4 core, in a few steps:

* Make sure the M0 is in reset

    See the `RESET_CTRL1` register of the RGU, bit `M0APP_RST`
    
    (User manual UM10503, 15.4.1 table 172)
* Enable the M0 clock

    See the `CLK_M4_M0APP_CFG` register of the CCU, bit `RUN`
    
    (User manual UM10503, 14.5.3 table 162)
* Configure the M0 boot address
      
    See the `M0APPMEMMAP` register in CREG
    
    (User manual UM10503, 11.4.15)
      
* Release the M0 reset

    See the `RESET_CTRL1` register of the RGU, bit `M0APP_RST`
    
    (User manual UM10503, 15.4.1 table 172)

After these steps, the M0 core boots from the memory address as configured in the `M0APPMEMMAP` register.
The M4 core is always in control of the M0 core, as it can assert the M0 reset at any time to stop or reboot the M0 core at any time.

See the [dual core blinky project](https://github.com/blinky101/blinky_lpc43xx/tree/master/dual_core) for an working example.
The example project source is split into the 'm0' and 'm4' folders, which contain the source code for each firmware.
