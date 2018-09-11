
MEMORY
{
  Flash_M4 (rx) : 	ORIGIN = 0x1a000000, LENGTH = 0x80000
  RAM_M4 (rwx) : 	ORIGIN = 0x10080000, LENGTH = 0xA000
}

/* Define a symbol for the top of each memory region */
__top_Flash_M4 = ORIGIN(Flash_M4) + LENGTH(Flash_M4);
__top_RAM_M4 = ORIGIN(RAM_M4) + LENGTH(RAM_M4);

