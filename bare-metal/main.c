
void blinky(void)
{
    // TODO port this from 11uxx to 43xx platform

    // configure P1_18 pin function as GPIO0[13]
    (*(volatile unsigned int *)(0x400860C8)) = 0;

    // configure GPIO direction
    (*(volatile unsigned int *)(0x400F6000)) |= (1 << 13);

    while(1) {

        // set LED GPIO low
        (*(volatile unsigned int *)(0x50002280)) = (1 << 7);
        for (int i = 0; i < 100000; ++i) __asm__("nop");

        // set LED GPIO high
        (*(volatile unsigned int *)(0x50002200)) = (1 << 7);
        for (int i = 0; i < 100000; ++i) __asm__("nop");

        // Toggle LED (low)
        (*(volatile unsigned int *)(0x50002300)) = (1 << 7);
        for (int i = 0; i < 300000; ++i) __asm__("nop");

        // Toggle LED (high)
        (*(volatile unsigned int *)(0x50002300)) = (1 << 7);
        for (int i = 0; i < 300000; ++i) __asm__("nop");

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

