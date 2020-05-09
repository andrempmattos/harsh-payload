/*
 * sys_log_mutex.c
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
 * \brief System log mutex implementation.
 *
 * \author Gabriel Mariano Marcelino <gabriel.mm8@gmail.com>
 *
 * \version 0.0.2
 *
 * \date 03/11/2019
 *
 * \defgroup sys_log_mutex Mutex
 * \ingroup sys_log
 * \{
 */

#include "sys_log.h"
#include "sys_log_config.h"

SemaphoreHandle_t xSysLogSemaphore = NULL;

bool sys_log_mutex_create()
{
    /* Create a mutex type semaphore */
    xSysLogSemaphore = xSemaphoreCreateMutex();

    if (xSysLogSemaphore == NULL)
    {
        sys_log_print_event_from_module(SYS_LOG_ERROR, SYS_LOG_DEVICE_NAME, "Error creating a mutex!");
        sys_log_new_line();

        return false;
    }

    return true;
}

bool sys_log_mutex_take()
{
    if (xSysLogSemaphore != NULL)
    {
        /* See if we can obtain the semaphore. If the semaphore is not */
        /* available wait SYS_LOG_MUTEX_WAIT_TIME_MS ms to see if it becomes free */
        if (xSemaphoreTake(xSysLogSemaphore, pdMS_TO_TICKS(SYS_LOG_MUTEX_WAIT_TIME_MS)) == pdTRUE)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}

bool sys_log_mutex_give()
{
    if (xSysLogSemaphore != NULL)
    {
        xSemaphoreGive(xSysLogSemaphore);

        return true;
    }
    else
    {
        return false;
    }
}

/** \} End of sys_log_mutex group */
