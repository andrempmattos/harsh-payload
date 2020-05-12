/*
 * watchdog_reset.h
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
 * \brief Watchdog reset task definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.9
 * 
 * \date 09/05/2020
 * 
 * \defgroup watchdog_reset Watchdog Reset
 * \ingroup tasks
 * \{
 */

#ifndef WATCHDOG_RESET_H_
#define WATCHDOG_RESET_H_

#include <FreeRTOS.h>
#include <task.h>

#define TASK_WATCHDOG_RESET_NAME                    "WatchdogReset"     /**< Task name. */
#define TASK_WATCHDOG_RESET_STACK_SIZE              128                 /**< Stack size in bytes. */
#define TASK_WATCHDOG_RESET_PRIORITY                1                   /**< Task priority. */
#define TASK_WATCHDOG_RESET_PERIOD_MS               100                 /**< Task period in milliseconds. */
#define TASK_WATCHDOG_RESET_INITIAL_DELAY_MS        0                   /**< Delay, in milliseconds, before the first execution. */

/**
 * \brief Watchdog reset handle.
 */
extern xTaskHandle xTaskWatchdogResetHandle;

/**
 * \brief Watchdog reset task.
 *
 * \param[in] pvParameters is a value that will passed as the task's parameter.
 *
 * \return None.
 */
void vTaskWatchdogReset(void *pvParameters);

#endif /* WATCHDOG_RESET_H_ */

/** \} End of watchdog_reset group */
