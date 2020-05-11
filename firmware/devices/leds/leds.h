/*
 * leds.h
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
 * \brief System LEDs definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.3
 * 
 * \date 09/05/2020
 * 
 * \defgroup leds LEDs
 * \ingroup devices
 * \{
 */

#ifndef LEDS_H_
#define LEDS_H_

#define LEDS_MODULE_NAME        "LEDs"

/* LED pin */
#define LED_SYSTEM_PIN          MSS_GPIO_25       /**< System LED. */
#define LED_SYSTEM_PIN_MASK		MSS_GPIO_25_MASK  /**< System LED mask. */

/* LED states */
#define HIGH		1
#define LOW			0

/**
 * \brief Initialization routine of the LEDs.
 *
 * \return None.
 */
void leds_init(void);

/**
 * \brief Sets a given LED.
 *
 * \param[in] None.
 *
 * \return None.
 */
void led_set(void);

/**
 * \brief Clears a given LED.
 *
 * \param[in] None.
 *
 * \return None.
 */
void led_clear(void);

/**
 * \brief Toggles a given LED.
 *
 * \param[in] None.
 *
 * \return None.
 */
void led_toggle(void);

#endif /* LEDS_H_ */

/** \} End of leds group */
