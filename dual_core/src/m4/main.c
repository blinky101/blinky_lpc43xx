#include "board.h"
#include "board_GPIO_ID.h"

#include <chip.h>
#include <lpc_tools/boardconfig.h>
#include <lpc_tools/GPIO_HAL.h>
#include <lpc_tools/clock.h>

unsigned int stack_value = 0xA5A55A5A;

// Desired CPU frequency in Hz
#define CPU_FREQ_HZ (60000000)

// Address of the code for the M0 core
#define M0_BOOT_ADDR (0x1B000000)

const GPIO *led_jitter;
const GPIO *led_xplorer;

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

int main(void)
{
    // board-specific setup
    board_setup();
    board_setup_NVIC();
    board_setup_pins();

    // fpu & system clock setup
    fpuInit();
    clock_set_frequency(CPU_FREQ_HZ);

    // initialize the M4 LED
    led_jitter = board_get_GPIO(GPIO_ID_LED_M4_JITTER);
    led_xplorer = board_get_GPIO(GPIO_ID_LED_M4_XPLORER);
    GPIO_HAL_set(led_jitter, HIGH);
    GPIO_HAL_set(led_xplorer, HIGH);

    // boot the M0 core
    M0_boot(M0_BOOT_ADDR);
    
    while(1){
        for(volatile int n=0;n<2000000;n++){} 
        GPIO_HAL_toggle(led_jitter);
        GPIO_HAL_toggle(led_xplorer);
        for(volatile int n=0;n<2000000;n++){} 
    }
    return 0;
}

