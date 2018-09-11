#include <chip.h>
#include "board.h"

// startup code needs this
unsigned int stack_value = 0xA5A55A5A;

// chip library depends on this
const uint32_t OscRateIn = 12000000;
const uint32_t ExtRateIn = 0;

// LED blins at half this frequency
#define SYSTICK_RATE_HZ (10)

volatile bool led_state = false;

void SysTick_Handler(void)
{
    Chip_GPIO_SetPinToggle(LPC_GPIO_PORT, 0, 13);
}

int main(void) {
    board_setup_pins();
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 2, true);
    fpuInit();

	SystemCoreClockUpdate();
	SysTick_Config(SystemCoreClock/SYSTICK_RATE_HZ);

    while(1);

    return 0;
}

