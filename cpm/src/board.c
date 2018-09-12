#include "board.h"
#include <chip.h>

static const PINMUX_GRP_T pinmuxing[] = {

        // Board LEDs 

        // jitter breakout
        {1, 18, (SCU_MODE_FUNC0)}, // GPIO0[13]

        // ngx xplorer
        {2, 12, (SCU_MODE_FUNC0)}, // GPIO1[12]
};

void board_setup_muxing(void)
{
    Chip_SCU_SetPinMuxing(pinmuxing, sizeof(pinmuxing) / sizeof(PINMUX_GRP_T));
}

void board_setup_GPIO(void)
{
    // jitter breakout
    Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 0, 13);
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 0, 13, false);

    // ngx xplorer
    Chip_GPIO_SetPinDIROutput(LPC_GPIO_PORT, 1, 12);
    Chip_GPIO_SetPinState(LPC_GPIO_PORT, 1, 12, false);
}

void board_setup_pins(void)
{
    board_setup_muxing();
    board_setup_GPIO();
}

