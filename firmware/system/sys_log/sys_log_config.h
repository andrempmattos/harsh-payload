/*
 * sys_log_config.h
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
 * \brief System log configuration parameters.
 * 
 * \author Gabriel Mariano Marcelino <gabriel.mm8@gmail.com>
 * 
 * \version 0.0.6
 * 
 * \date 22/02/2019
 * 
 * \defgroup sys_log_config Configuration
 * \ingroup sys_log
 * \{
 */

#ifndef SYS_LOG_CONFIG_H_
#define SYS_LOG_CONFIG_H_

#include <system/config.h>

#include "sys_log.h"

/* Device name */
#define SYS_LOG_DEVICE_NAME             "System Log"

/* UART */
#define SYS_LOG_UART_BAUDRATE_BPS       115200

/* Mutex config. */
#define SYS_LOG_MUTEX_WAIT_TIME_MS      100

/* Log messages colors */
#define SYS_LOG_SYSTEM_TIME_COLOR       SYS_LOG_COLOR_GREEN
#define SYS_LOG_MODULE_NAME_COLOR       SYS_LOG_COLOR_MAGENTA
#define SYS_LOG_WARNING_COLOR           SYS_LOG_COLOR_YELLOW
#define SYS_LOG_ERROR_COLOR             SYS_LOG_COLOR_RED

#endif /* SYS_LOG_CONFIG_H_ */

/** \} End of sys_log_config group */
