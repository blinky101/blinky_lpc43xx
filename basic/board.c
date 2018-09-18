#include "board.h"
#include "chip.h"

void board_configure_pins(void)
{

    // Setup pin muxing from P2_12 to GPIO1[12]

    const int pinmux_options = 0;
    chip_scu_pinmux(2, 12, pinmux_options);

    // configure GPIO direction=1 (out)
    const int direction = 1;
    chip_gpio_dir_set(1, 12, direction);
}

void board_led_set(bool on) {
    if (on) {
        chip_gpio_set(1, 12);
    } else {
        chip_gpio_clear(1, 12);
    }
}

void board_led_toggle(void) {
    chip_gpio_toggle(1, 12);
}
