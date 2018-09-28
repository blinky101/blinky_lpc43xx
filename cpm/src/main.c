#include "board.h"
#include "board_GPIO_ID.h"

#include <chip.h>
#include <lpc_tools/boardconfig.h>
#include <lpc_tools/GPIO_HAL.h>
#include <lpc_tools/clock.h>

// startup code needs this
unsigned int stack_value = 0xA5A55A5A;

// LED blinks at half this frequency
#define SYSTICK_RATE_HZ (10)

// Desired CPU frequency in Hz
#define CPU_FREQ_HZ (60000000)

const GPIO *led_jitter;
const GPIO *led_xplorer;

void SysTick_Handler(void)
{
    GPIO_HAL_toggle(led_jitter);
    GPIO_HAL_toggle(led_xplorer);
}


int main(void) {
    // board-specific setup
    board_setup();
    board_setup_NVIC();
    board_setup_pins();

    // fpu & system clock setup
    fpuInit();
    clock_set_frequency(CPU_FREQ_HZ);

    led_jitter = board_get_GPIO(GPIO_ID_LED_JITTER);
    led_xplorer = board_get_GPIO(GPIO_ID_LED_XPLORER);

    GPIO_HAL_set(led_jitter, HIGH);
    GPIO_HAL_set(led_xplorer, HIGH);

	SysTick_Config(SystemCoreClock/SYSTICK_RATE_HZ);

    while(1);

    return 0;
}

