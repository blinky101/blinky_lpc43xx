#include <chip.h>
#include "board.h"

unsigned int stack_value = 0xA5A55A5A;

int main(void) {
    board_setup_pins();
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 2, true);
    
    while(1){
        for(volatile int n=0;n<500000;n++){} 
        Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 2, true);
        for(volatile int n=0;n<500000;n++){} 
        Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 2, false);
    }
    return 0;
}

