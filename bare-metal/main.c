
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

