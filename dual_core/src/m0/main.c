#include "board.h"
#include "board_GPIO_ID.h"

#include <chip.h>
#include <lpc_tools/boardconfig.h>
#include <lpc_tools/GPIO_HAL.h>

unsigned int stack_value = 0xA5A55A5A;

const GPIO *led_jitter;
const GPIO *led_xplorer;

int main(void)
{
    board_setup();
    board_setup_NVIC();

    // initialize the M0 LED
    led_jitter = board_get_GPIO(GPIO_ID_LED_M0_JITTER);
    led_xplorer = board_get_GPIO(GPIO_ID_LED_M0_XPLORER);
    GPIO_HAL_set(led_jitter, HIGH);
    GPIO_HAL_set(led_xplorer, HIGH);
    
    while(1){
        for(volatile int n=0;n<500000;n++){} 
        GPIO_HAL_set(led_jitter, HIGH);
        GPIO_HAL_set(led_xplorer, HIGH);
        for(volatile int n=0;n<500000;n++){} 
        GPIO_HAL_set(led_jitter, LOW);
        GPIO_HAL_set(led_xplorer, LOW);
    }
    return 0;
}

