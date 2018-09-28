#include <chip.h>
#include "board.h"

const uint32_t OscRateIn = 12000000;
const uint32_t ExtRateIn = 0;

unsigned int stack_value = 0xA5A55A5A;

#define M0_BOOT_ADDR (0x1B000000)
void M0_boot(uint32_t m0_image_addr)
{
    // Make sure the alignment is OK
    if (m0_image_addr & 0xFFF) {
        return;
    }

    // Make sure the M0 core is being held in reset via the RGU
    Chip_RGU_TriggerReset(RGU_M0APP_RST);
    Chip_Clock_Enable(CLK_M4_M0APP);

    // Keep in mind the M0 image must be aligned on a 4K boundary
    Chip_CREG_SetM0AppMemMap(m0_image_addr);
    Chip_RGU_ClearReset(RGU_M0APP_RST);
}

int main(void) {
    board_setup_pins();
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 2, true);
    fpuInit();

    M0_boot(M0_BOOT_ADDR);
    
    while(1){
        for(volatile int n=0;n<10000000;n++){} 
        Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 13, true);
        for(volatile int n=0;n<10000000;n++){} 
        Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 13, false);
    }
    return 0;
}

