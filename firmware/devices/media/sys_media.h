/*
 * sys_media.h
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
 * \brief System media device definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.34
 * 
 * \date 13/05/2020
 * 
 * \defgroup sys_media System Media
 * \ingroup devices
 * \{
 */

#ifndef SYS_MEDIA_H_
#define SYS_MEDIA_H_

#include <stdint.h>

#define SYS_MEDIA_MODULE_NAME           "Sys_Media"

#define MEDIA_ENVM_START_ADDR		0x60000000u			/**< Embedded flash memory start address. */
#define MEDIA_ENVM_END_ADDR			0x6003FFFFu			/**< Embedded flash memory end address. */
#define MEDIA_ESRAM_START_ADDR		0x20000000u			/**< Embedded SRAM memory start address. */
#define MEDIA_ESRAM_END_ADDR		0x2000FFFFu			/**< Embedded SRAM memory end address. */

/**
 * \brief System media types.
 */
typedef enum
{
    MEDIA_ENVM=0,      	/**< Embedded flash memory. */
    MEDIA_ESRAM,        /**< Embedded SRAM memory. */
} sys_media_types_e;

/**
 * \brief Media type.
 */
typedef uint8_t media_t;

/**
 * \brief Media initialization.
 *
 * \param[in] med is the storage media to initiailize. It can be:
 * \parblock
 *      -\b MEDIA_ENVM
 *		-\b MEDIA_ESRAM
 *      .
 * \endparblock
 *
 * \return The status/error code.
 */
int sys_media_init(media_t med);

/**
 * \brief Writes data into a given address of a media device.
 *
 * \param[in] med is the storage media to write. It can be:
 * \parblock
 *      -\b MEDIA_ENVM
 *		-\b MEDIA_ESRAM
 *      .
 * \endparblock
 *
 * \param[in] addr is the address to write data.
 *
 * \param[in] data is an array of bytes to write.
 *
 * \param[in] len is the number of bytes to write.
 *
 * \return The status/error code.
 */
int sys_media_write(media_t med, uint32_t addr, uint8_t *data, uint16_t len);

/**
 * \brief Reads data from a given address of a media device.
 *
 * \param[in] med is the storage media to read. It can be:
 * \parblock
 *      -\b MEDIA_ENVM
 *		-\b MEDIA_ESRAM
 *      .
 * \endparblock
 *
 * \param[in] addr is the address to read.
 *
 * \param[in,out] data is a pointer to store the read data.
 *
 * \param[in] len is the number of bytes to read starting at addr.
 *
 * \return The status/error code.
 */
int sys_media_read(media_t med, uint32_t addr, uint8_t *data, uint16_t len);

#endif /* SYS_MEDIA_H_ */

/** \} End of sys_media group */
