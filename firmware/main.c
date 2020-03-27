/* 
 * main.c
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
 * \brief Main file.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.1
 * 
 * \date 27/03/2020
 * 
 * \defgroup main Main file
 * \{
 */

#include "drivers/mss_hpdma/mss_hpdma.h"
#include "drivers/mss_gpio/mss_gpio.h"
#include "drivers/mss_uart/mss_uart.h"
#include "CMSIS/system_m2sxxx.h"
#include "top_hw_platform.h"

#define HPDMA_TRANSFER_SIZE             1024
#define HPDMA_TRANSFER_SIZE_ARRAY       ( HPDMA_TRANSFER_SIZE/4 )

/*
 * Local functions prototypes.
 */
static void peripherals_init (void);
static void delay(void);

static void xfer_complete_handler (hpdma_status_t status);
static void load_pattern (uint32_t * buffer, uint32_t word_size);

static void uart_splash_message(void);


/*
 * The g_buffer_a and g_buffer_b arrays are used for HPDMA transfers.
 */
uint32_t g_buffer_a[HPDMA_TRANSFER_SIZE_ARRAY];
uint32_t g_buffer_b[HPDMA_TRANSFER_SIZE_ARRAY];

/*
 * Transfer complete Status updated by Interrupt routine.
 */
volatile uint8_t g_xfr_completed;

/*
 * Instance of UART0 to be used by the driver operations
 */
mss_uart_instance_t * const gp_my_uart = &g_mss_uart0;

/*
 * main function.
 */
int main(void)
{
    uint32_t gpio_inputs;
    uint32_t gpio_pattern;

    peripherals_init();

    uart_splash_message();

    /* Infinite loop */
    while(1)
    {

    	/*
		 * Display current iteration.
		 */
    	//MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"Iteration: ");
        //MSS_UART_polled_tx(&g_mss_uart0, &iteration_counter, 1);
    	MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n\r");
    	//iteration_counter++;

        /*
         * Load pattern into g_buffer_a word array.
         */
        load_pattern(g_buffer_a, HPDMA_TRANSFER_SIZE_ARRAY);

        MSS_HPDMA_set_handler(xfer_complete_handler);

        /*
         * Start a HPDMA transfer from g_buffer_a[] to SDRAM and wait for the operation on HPDMA channel 0 to complete.
         */
        g_xfr_completed = 0u;
        MSS_HPDMA_start((uint32_t)g_buffer_a, EXTERNAL_SDR_SDRAM_ADDR, HPDMA_TRANSFER_SIZE, HPDMA_TO_DDR);
        while(g_xfr_completed == HPDMA_IN_PROGRESS);
        
        if (g_xfr_completed == HPDMA_COMPLETED)
        {
            MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"HPDMA write transfer succeeded.\n\r");
            //MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"Written pattern:\n\r");
            //MSS_UART_polled_tx(&g_mss_uart0, (uint8_t)g_buffer_a, HPDMA_TRANSFER_SIZE);
            //MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n\r");
        }
        else 
        {
            MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"HPDMA write transfer failed.\n\r");
        }


        /*
         * Start a HPDMA transfer from SDRAM to g_buffer_b[] and wait for the operation on HPDMA channel 0 to complete.
         */
        g_xfr_completed = 0u;
        MSS_HPDMA_start(EXTERNAL_SDR_SDRAM_ADDR, (uint32_t)g_buffer_b, HPDMA_TRANSFER_SIZE, HPDMA_FROM_DDR);
        while(g_xfr_completed == HPDMA_IN_PROGRESS);
        
        if 
        ( 
            (g_xfr_completed == HPDMA_COMPLETED) &&
            (g_buffer_a[0] == g_buffer_b[0]) &&
            (g_buffer_a[HPDMA_TRANSFER_SIZE_ARRAY-1] == g_buffer_b[HPDMA_TRANSFER_SIZE_ARRAY-1])
        )
        {
            MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"HPDMA read transfer and memory change succeeded.\n\r");
            //MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"Read pattern:\n\r");
            //MSS_UART_polled_tx(&g_mss_uart0, (uint8_t)g_buffer_b, HPDMA_TRANSFER_SIZE);
            //MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n\r");
        }
        else 
        {
            MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"HPDMA read transfer or memory change failed.\n\r");
            //MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"Read pattern:\n\r");
            //MSS_UART_polled_tx(&g_mss_uart0, (uint8_t)g_buffer_b, HPDMA_TRANSFER_SIZE);
            //MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n\r");
        }

        
        /*
         * Check if user button is pressed.
         */
        gpio_inputs = MSS_GPIO_get_inputs();
        if ( (gpio_inputs & MSS_GPIO_29_MASK) == 0)
        {
            MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"Button pressed!\n\r");
        }

        /*
         * Toggle GPIO output pattern by doing an exclusive OR with system LED GPIO mask.
         */
        gpio_pattern = MSS_GPIO_get_outputs();
        gpio_pattern ^= MSS_GPIO_25_MASK;
        MSS_GPIO_set_outputs(gpio_pattern);

        /*
         * Delay cycle operation
         */
        delay();
    }
}



/*
 * Peripherals initialization.
 */
static void peripherals_init(void)
{
    /*
     *  Turn off watchdog timer case enabled in MSS.
     */
    SYSREG->WDOG_CR = 0;

    /*
     *  Initialize HPDMA controller.
     */
    MSS_HPDMA_init();

    /*
     *  Initialize UART0 interface.
     */
    MSS_UART_init(gp_my_uart, MSS_UART_115200_BAUD, MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT);

    /*
     *  Initialize GPIO ports.
     */
    MSS_GPIO_init();
    MSS_GPIO_config(MSS_GPIO_29, MSS_GPIO_INPUT_MODE);
    MSS_GPIO_config(MSS_GPIO_25, MSS_GPIO_OUTPUT_MODE);
}

/*
  Primitive delay operation.
 */
static void delay(void)
{
    volatile uint32_t delay_count = SystemCoreClock / 16u;

    while(delay_count > 0u)
    {
        --delay_count;
    }
}

/*
 * Load bit pattern into buffer passed as parameter. The pattern will change
 * with each call to this function.
 */
static void load_pattern(uint32_t * buffer, uint32_t word_size)
{
    uint32_t i;
    static uint32_t increment = 1;
    for(i = 0; i < word_size; ++i)
    {
        buffer[i] = i + increment;
    }
    ++increment;
}

/*
 * HPDMA transfer complete handler.
 */
static void xfer_complete_handler(hpdma_status_t status)
{
    /* Transfer has completed */
    g_xfr_completed = 1u;
}

/*
 * UART splash message.
 */
static void uart_splash_message(void)
{
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"\n\r\n\r**********************************************************************\n\r");
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"************************** Prototype Demo ****************************\n\r");
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"**********************************************************************\n\r");
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"************* Demonstrate SDRAM, UART and GPIO operation *************\n\r");
    MSS_UART_polled_tx_string(gp_my_uart,(const uint8_t*)"**********************************************************************\n\r");
}


/** \} End of main group */
