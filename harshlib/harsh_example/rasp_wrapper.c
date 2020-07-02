/*
 * rasp_wrapper.c
 *
 * MIT License
 *
 * Copyright (c) 2020 André Mattos
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

/**
 * \brief Raspberry PI 3 (Model 3A+) wrapper implementation.
 *
 * \author Andre Mattos <andrempmattos@gmail.com>
 *
 * \version 0.0.8
 *
 * \date 23/06/2020
 *
 * \addtogroup rasp_wrapper
 * \{
 */

#include "rasp_wrapper.h"

int system_init(void)
{
    if (!bcm2835_init())
    {
      printf("bcm2835_init failed. Are you running as root??\n");
      return -1;
    }

    /*
     * If you call this, it will not actually access the GPIO
	 * Use for testing
	 * bcm2835_set_debug(1);
	*/

	return 0;
}

void system_close(void) {
	bcm2835_spi_end();
	bcm2835_close();
}


void gpio_init(void)
{
    /* Set the pins to be an output */
    bcm2835_gpio_fsel(OBC_GPIO_0, BCM2835_GPIO_FSEL_OUTP);
    bcm2835_gpio_fsel(OBC_GPIO_1, BCM2835_GPIO_FSEL_OUTP);
}

void gpio_set(uint8_t pin)
{
    /* Set GPIO high */
    bcm2835_gpio_write(pin, HIGH);
}

void gpio_clear(uint8_t pin)
{
	/* Set GPIO low */
	bcm2835_gpio_write(pin, LOW);
}


int spi_init(void)
{
    /**
     * After installing bcm2835, you can build this with something like:
	 * gcc -o spi spi.c -l bcm2835
	 * sudo ./spi
	 *
	 * Or you can test it before installing with:
	 * gcc -o spi -I ../../src ../../src/bcm2835.c spi.c
	 * sudo ./spi
	 */

	/* SPI interface initialization */
    if (!bcm2835_spi_begin())
    {
      printf("bcm2835_spi_begin failed. Are you running as root??\n");
      return -1;
    }

    /* Configure SPI parameters with default values */
    bcm2835_spi_setBitOrder(BCM2835_SPI_BIT_ORDER_MSBFIRST);
    bcm2835_spi_setDataMode(BCM2835_SPI_MODE0);
    bcm2835_spi_setClockDivider(BCM2835_SPI_CLOCK_DIVIDER_65536);
    bcm2835_spi_chipSelect(BCM2835_SPI_CS0);
    bcm2835_spi_setChipSelectPolarity(BCM2835_SPI_CS0, LOW);

    return 0;
}


void log_print_event(char *module_name, char *funct_name, char *msg)
{
    printf("\033[0;32m");
	printf("[%d] ", 456456);
	printf("\033[0;35m");
	printf("%s: ", module_name);
	printf("\033[0;36m");
	printf("%s: ", funct_name);
  	printf("\033[0m");
	printf("%s\n", msg);
}


void delay_ms(uint32_t time_ms)
{
	bcm2835_delay(time_ms);
}

void spi_send(uint8_t *send_data, uint8_t length)
{
	uint8_t counter = 0;
	
	while(counter++ < length)
	{
		bcm2835_spi_transfer(*(send_data++));
	}
}

void spi_read(uint8_t *read_data, uint8_t length)
{
	uint8_t counter = 0;
	uint8_t dummy = 0;
	
	while(counter++ < length)
	{
		*(read_data++) = bcm2835_spi_transfer(dummy);
	}
}

uint32_t get_timestamp(void)
{
	return 0;
}

void store_payload_data(uint8_t *data, uint8_t length)
{
    for(int i = 0; i < length; i++) {
        printf("%d\t", *(data++));
    }
}


/** \} End of rasp_wrapper group */
