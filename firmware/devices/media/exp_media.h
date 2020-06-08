/*
 * exp_media.h
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
 * \brief Experiment media device definition.
 * 
 * \author Andre Mattos <andrempmattos@gmail.com>
 * 
 * \version 0.0.34
 * 
 * \date 13/05/2020
 * 
 * \defgroup exp_media Experiment Media
 * \ingroup devices
 * \{
 */

#ifndef EXP_MEDIA_H_
#define EXP_MEDIA_H_

#include <stdint.h>

#define EXP_MEDIA_MODULE_NAME           "Exp_Media"

/**
 * \brief Experiment media types.
 */
typedef enum
{
    MEDIA_SDRAM_B,		/**< External SDRAM memory B. */
    MEDIA_SDRAM_D,		/**< External SDRAM memory D. */
    MEDIA_SDRAM_F,		/**< External SDRAM memory F. */
} exp_media_types_e;

/**
 * \brief Media type.
 */
typedef uint8_t media_t;

/**
 * \brief Media initialization.
 *
 * \param[in] med is the storage media to initiailize. It can be:
 * \parblock
 *      -\b MEDIA_SDRAM_B
 *      -\b MEDIA_SDRAM_D
 *      -\b MEDIA_SDRAM_F
 *      .
 * \endparblock
 *
 * \return The status/error code.
 */
int exp_media_init(media_t med);

/**
 * \brief Writes data into a given address of a media device.
 *
 * \param[in] med is the storage media to write. It can be:
 * \parblock
 *      -\b MEDIA_SDRAM_B
 *      -\b MEDIA_SDRAM_D
 *      -\b MEDIA_SDRAM_F
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
int exp_media_write(media_t med, uint32_t addr, uint32_t *data, uint16_t len);

/**
 * \brief Reads data from a given address of a media device.
 *
 * \param[in] med is the storage media to read. It can be:
 * \parblock
 *      -\b MEDIA_SDRAM_B
 *      -\b MEDIA_SDRAM_D
 *      -\b MEDIA_SDRAM_F
 *      .
 * \endparblock
 *
 * \param[in] addr is the address to read.
 *
 * \param[in,out] data is a pointer to store the read data.
 *
 * \param[in] len is multiples of 4 bytes to read starting at addr.
 *
 * \return The status/error code.
 */
int exp_media_read(media_t med, uint32_t addr, uint32_t *data, uint16_t len);

#endif /* EXP_MEDIA_H_ */

/** \} End of exp_media group */
