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
 * \brief Main implementation.
 *
 * \author Andre Mattos <andrempmattos@gmail.com>
 *
 * \version 0.0.10
 *
 * \date 23/06/2020
 *
 * \addtogroup main
 * \{
 */

#include "../harshlib/harshlib.h"
#include "rasp_wrapper.h"
#include <stdint.h>

#define EXPERIMENT_SECTION_PERIOD	(10*1000)		/* Period between experiment section cycles */
#define EXPERIMENT_ROUTINE_PERIOD	(10*1000)		/* Period between experiment routine cycles */
#define EXPERIMENT_ROUTINE_CYCLES	60				/* Number of routine cycles performed in one experiment section */
#define MAX_PAYLOAD_ERRORS_ALLOWED	20				/* Maximum payload errors allowed */
#define MAX_PAYLOAD_DATA_PACKAGES	5				/* Maximum payload errors allowed */

#define MAIN_MODULE_NAME			"main"

int main(int argc, char const *argv[])
{
	uint8_t cycle = 0;

	command_package_t command;
	state_package_t state;
	data_package_t data;

	/* System initialization routine */
	system_init();

	/* GPIO initialization routine (used for the payload enables) */
	gpio_init();

	/* SPI initialization routine (used for the payload communication) */
	spi_init();

	/* GPIO initialization routine (keep the paylaod turned-off) */
	harsh_init();

	/* This loop perform periodic experiment sections (it could be scheduled instead) */
	while(1)
	{
		/* Turn-on the payload and perform a interface communication test */
		if(harsh_start() == 0)
		{
			/* Set command parameters */
			command.operation_mode = EXPERIMENT_PAYLOAD;
			command.execution_config = ENABLE_SDRAM_MEMORY_B | ENABLE_SDRAM_MEMORY_D | ENABLE_SDRAM_MEMORY_F | ENABLE_STATIC_TESTS;
			command.obc_sys_time = get_timestamp();

			if(harsh_set_config(&command) != 0)
			{
				log_print_event(MAIN_MODULE_NAME, "harsh_config", "Error detected during set config routine!");
			}

			/* This loop perform the regular routines during an experiment section */
			while(cycle++ < EXPERIMENT_ROUTINE_CYCLES)
			{
				/* Get the payload state */
				if(harsh_get_state(&state) == 0)
				{
					/* Check timestamp synchronization */
					if(state.time_stamp != get_timestamp())
					{
						log_print_event(MAIN_MODULE_NAME, "state_check", "Different timestamp detected!");
					}

					/* Check parameters configuration */
					if((state.operation_mode != command.operation_mode) || (state.execution_config != command.execution_config))
					{
						log_print_event(MAIN_MODULE_NAME, "state_check", "Different parameter config detected!");
					}

					/* Check errors (it could be implement as an error handler instead) */
					if(state.error_count < MAX_PAYLOAD_ERRORS_ALLOWED)
					{
						/* Case experiment critical failure, then stop the execution for this entire section */
						if (state.error_code & EXPERIMENT_FAILURE)
						{
							harsh_stop();
							log_print_event(MAIN_MODULE_NAME, "state_check", "Payload turned-off!");
						}
						/* Case experiment memory interface failure, then just notify (it should be properly handled) */
						if (state.error_code & (MEMORY_B_INTERFACE_ERROR | MEMORY_D_INTERFACE_ERROR | MEMORY_F_INTERFACE_ERROR))
						{
							log_print_event(MAIN_MODULE_NAME, "state_check", "Experiment memories interface errors detected");
						}
						/* Case experiment memory latch-up failure, then just notify (it should be properly handled) */
						if (state.error_code & (MEMORY_B_LATCHUP | MEMORY_D_LATCHUP | MEMORY_F_LATCHUP))
						{
							log_print_event(MAIN_MODULE_NAME, "state_check", "Experiment memories latch-up errors detected");
						}
					}
					else
					{
						/* Case maximum allowed errors achieved, then stop execution for this entire section */
						harsh_stop();
						log_print_event(MAIN_MODULE_NAME, "state_check", "Maximum payload allowed errors achieved");
						log_print_event(MAIN_MODULE_NAME, "state_check", "Payload turned-off!");
					}

					/* Check the experiment remainining data packages */
					if (state.data_packages_count > 0)
					{
						log_print_event(MAIN_MODULE_NAME, "data_packages", "Reading data packages");
						
						/* Read the packages with a maximum of "MAX_PAYLOAD_DATA_PACKAGES" packages */
						if (state.data_packages_count < MAX_PAYLOAD_DATA_PACKAGES)
						{
							for (int i = 0; i < state.data_packages_count; i++)
							{
								harsh_get_data(&data);
								store_payload_data((uint8_t *)&data, sizeof(data));
							}
						}
						else
						{
							for (int i = 0; i < MAX_PAYLOAD_DATA_PACKAGES; i++)
							{
								harsh_get_data(&data);
								store_payload_data((uint8_t *)&data, sizeof(data));
							}
						}
					}
				}
				else
				{
					log_print_event(MAIN_MODULE_NAME, "state_check", "Error detected during get state routine!");
				}

				delay_ms(EXPERIMENT_ROUTINE_PERIOD);
			}
		}
		else 
		{
			log_print_event(MAIN_MODULE_NAME, "harsh_start", "Error detected during payload initialization!");
		}

		delay_ms(EXPERIMENT_SECTION_PERIOD);
	}

	/* System termination routine */
	system_close();
	return 0;
}

/** \} End of main group */