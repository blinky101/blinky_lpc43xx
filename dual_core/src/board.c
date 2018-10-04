#include "board.h"
#include "board_GPIO_ID.h"

#include <lpc_tools/boardconfig.h>
#include <lpc_tools/GPIO_HAL.h>
#include <c_utils/static_assert.h>

#include <chip.h>

// Oscillator frequency, needed by chip libraries
const uint32_t OscRateIn = 12000000;
const uint32_t ExtRateIn = 0;


static const PinMuxConfig pinmuxing[] = {

        // Board LEDs 

        // jitter breakout
        {1, 17, (SCU_MODE_FUNC0)}, // GPIO0[12]
        {1, 18, (SCU_MODE_FUNC0)}, // GPIO0[13]

        // ngx xplorer
        {2, 11, (SCU_MODE_FUNC0)}, // GPIO1[11]
        {2, 12, (SCU_MODE_FUNC0)}, // GPIO1[12]
};

static const GPIOConfig pin_config[] = {
    [GPIO_ID_LED_M0_JITTER] = {{0,  12}, GPIO_CFG_DIR_OUTPUT_LOW},
    [GPIO_ID_LED_M4_JITTER] = {{0,  13}, GPIO_CFG_DIR_OUTPUT_LOW},

    [GPIO_ID_LED_M0_XPLORER] = {{1,  11}, GPIO_CFG_DIR_OUTPUT_LOW},
    [GPIO_ID_LED_M4_XPLORER] = {{1,  12}, GPIO_CFG_DIR_OUTPUT_LOW},

};

// pin config struct should match GPIO_ID enum
STATIC_ASSERT( (GPIO_ID_MAX == (sizeof(pin_config)/sizeof(GPIOConfig))));

static const BoardConfig config = {
    .nvic_configs = NULL,
    .nvic_count = 0,

    .pinmux_configs = pinmuxing,
    .pinmux_count = sizeof(pinmuxing) / sizeof(pinmuxing[0]),
    
    .GPIO_configs = pin_config,
    .GPIO_count = sizeof(pin_config) / sizeof(pin_config[0]),

    .ADC_configs = NULL,
    .ADC_count = 0
};

void board_setup(void)
{
    board_set_config(&config);
}

