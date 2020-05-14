/*
 * latchup_monitors.h
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
 * \brief Latch-up monitor implementation.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.16
 * 
 * \date 12/05/2020
 * 
 * \defgroup latchup_monitors Latch-up monitor
 * \ingroup devices
 * \{
 */

#ifndef LATCHUP_H_
#define LATCHUP_H_

#include <stdint.h>

#define LATCHUP_MODULE_NAME        "LATCHUP"

/* Latch-up monitor pins */
#define MEMORY_B_LATCHUP_PWGD_STATUS_PIN    MSS_GPIO_3     	/**< SDRAM Memory B latch-up monitor power good status pin. */
#define MEMORY_D_LATCHUP_PWGD_STATUS_PIN	MSS_GPIO_4  	/**< SDRAM Memory D latch-up monitor power good status pin. */
#define MEMORY_F_LATCHUP_PWGD_STATUS_PIN    MSS_GPIO_5  	/**< SDRAM Memory F latch-up monitor power good status pin. */
#define MEMORY_B_LATCHUP_ENABLE_PIN    		MSS_GPIO_6     	/**< SDRAM Memory B latch-up monitor enable pin. */
#define MEMORY_D_LATCHUP_ENABLE_PIN    		MSS_GPIO_7     	/**< SDRAM Memory D latch-up monitor enable pin. */
#define MEMORY_F_LATCHUP_ENABLE_PIN    		MSS_GPIO_8     	/**< SDRAM Memory F latch-up monitor enable pin. */

/* GPIO states */
#define HIGH		1
#define LOW			0

/* Latchup monitor devices */
#define MEMORY_B_LATCHUP_MONITOR			0				/**< SDRAM Memory B latch-up monitor device. */
#define MEMORY_D_LATCHUP_MONITOR			1				/**< SDRAM Memory D latch-up monitor device. */
#define MEMORY_F_LATCHUP_MONITOR			2				/**< SDRAM Memory F latch-up monitor device. */

/**
 * \brief Latchup monitor type.
 */
typedef uint8_t latchup_monitor_t;

/**
 * \brief Initialization routine of the latch-up monitors.
 *
 * \return The status/error code.
 */
int latchup_monitors_init(void);

/**
 * \brief Get a given latch-up monitor power good status.
 *
 * \param[in] l is the latchup monitor device.
 *
 * \return None.
 */
void latchup_monitors_get_status(latchup_monitor_t *l);

/**
 * \brief Enable a given latch-up monitor device.
 *
 * \param[in] l is the latchup monitor device.
 *
 * \return None.
 */
void latchup_monitors_set_enable(latchup_monitor_t *l);


#endif /* LATCHUP_H_ */

/** \} End of latchup_monitors group */
