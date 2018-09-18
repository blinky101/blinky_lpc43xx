#include "chip.h"
#include "chip_lpc43xx.h"

void chip_scu_pinmux(uint8_t port, uint8_t pin, uint8_t options)
{
	LPC_SCU->SFSP[port][pin] = options;
}

void chip_gpio_toggle(uint8_t port, uint8_t pin)
{
    LPC_GPIO_PORT->NOT[port] |= (1 << pin);
}

void chip_gpio_set(uint8_t port, uint8_t pin)
{
    LPC_GPIO_PORT->SET[port] |= (1 << pin);
}

void chip_gpio_clear(uint8_t port, uint8_t pin)
{
    LPC_GPIO_PORT->CLR[port] |= (1 << pin);
}

void chip_gpio_dir_set(uint8_t port, uint8_t pin, uint8_t dir)
{
    LPC_GPIO_PORT->DIR[port] |= (dir << pin);
}
