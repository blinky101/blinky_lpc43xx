
MEMORY
{
  /* common memory layout for all flash-based 43xx parts */
  Flash (rx) : ORIGIN = 0x1a000000, LENGTH = 0x40000 /* 256kB */
  RAM (rwx) : ORIGIN = 0x10080000, LENGTH = 0xA000 /* 40kB */
}

/* Define a symbol for the top of each memory region */
__top_Flash = 0x0 + 0xC000;
__top_RAM = 0x10000000 + 0x2000;

ENTRY(ResetISR)

SECTIONS
{

    /* MAIN TEXT SECTION */
    .text : ALIGN(4)
    {
        FILL(0xff)
        __vectors_start__ = ABSOLUTE(.) ;
        KEEP(*(.isr_vector))

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


        *(.after_vectors*)

    } >Flash

    .text : ALIGN(4)
    {
         *(.text*)
        *(.rodata .rodata.* .constdata .constdata.*)
        . = ALIGN(4);

    } > Flash

    /* MAIN DATA SECTION */


    .uninit_RESERVED : ALIGN(4)
    {
        KEEP(*(.bss.$RESERVED*))
        . = ALIGN(4) ;
        _end_uninit_RESERVED = .;
    } > RAM


	/* Main DATA section (RAM) */
	.data : ALIGN(4)
	{
	   FILL(0xff)
	   _data = . ;
	   *(vtable)
	   *(.data*)
	   . = ALIGN(4) ;
	   _edata = . ;
	} > RAM AT>Flash

    /* MAIN BSS SECTION */
    .bss : ALIGN(4)
    {
        _bss = .;
        *(.bss*)
        *(COMMON)
        . = ALIGN(4) ;
        _ebss = .;
        PROVIDE(end = .);
    } > RAM


    PROVIDE(_pvHeapStart = .);
    PROVIDE(_vStackTop = __top_RAM - 0);

    PROVIDE(__valid_user_code_checksum = 0 - 
        (_vStackTop 
        + (ResetISR + 1) 
        + (NMI_Handler + 1) 
        + (HardFault_Handler + 1)
        + (MemManage_Handler + 1)
        + (BusFault_Handler + 1)
        + (UsageFault_Handler + 1)
        )
    );
}
