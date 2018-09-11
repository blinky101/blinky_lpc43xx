
/* TODO verify this works on 43xx */
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

    /* Calculate the usercode checksum as per the LPC11uxx user manual:
     * UM10452, chapter 20.7.
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

