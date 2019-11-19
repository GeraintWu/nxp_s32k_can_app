/*
 * Copyright (c) 2015 - 2016 , Freescale Semiconductor, Inc.
 * Copyright 2016-2018 NXP
 * All rights reserved.
 *
 * THIS SOFTWARE IS PROVIDED BY NXP "AS IS" AND ANY EXPRESSED OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL NXP OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

#include "helper_functions.h"

#include <stdint.h>
#include <stdbool.h>

/* @brief: Calculate the values to be used by pdb to generate
 *        a interrupt at a specific timeout.
 * @param pdbConfig: pointer to the PDB configuration struct
 * @param type:      pdb_timer_config_t *
 * @param uSec:      interval for pdb interrupt in microseconds
 * @param type:      uint32_t
 * @param intVal:    pointer to the storage element where to set the calculated value
 * @param type:      uint16_t
 * @return:          Returns true if the interrupt period can be achieved, false if not
 * @return type:     bool
 */
bool calculateIntValue(const pdb_timer_config_t *pdbConfig, uint32_t uSec, uint16_t * intVal)
{
    /* Local variables used to store different parameters
     * such as frequency and prescalers
     */
    uint32_t    intVal_l            = 0;
    uint8_t     pdbPrescaler        = (1 << pdbConfig->clkPreDiv);
    uint8_t     pdbPrescalerMult    = 0;
    uint32_t    pdbFrequency;

    bool resultValid = false;

    /* Get the Prescaler Multiplier from the configuration structure */
    switch (pdbConfig->clkPreMultFactor)
    {
        case PDB_CLK_PREMULT_FACT_AS_1:
            pdbPrescalerMult    =   1U;
            break;
        case PDB_CLK_PREMULT_FACT_AS_10:
            pdbPrescalerMult    =   10U;
            break;
        case PDB_CLK_PREMULT_FACT_AS_20:
            pdbPrescalerMult    =   20U;
            break;
        case PDB_CLK_PREMULT_FACT_AS_40:
            pdbPrescalerMult    =   40U;
            break;
        default:
            /* Defaulting the multiplier to 1 to avoid dividing by 0*/
            pdbPrescalerMult    =   1U;
            break;
    }

    /* Get the frequency of the PDB clock source and scale it
     * so that the result will be in microseconds
     */
    CLOCK_SYS_GetFreq(CORE_CLK, &pdbFrequency);
    pdbFrequency /= 1000000;

    /* Calculate the interrupt value for the prescaler, multiplier, frequency
     * configured and time needed.
     */
    intVal_l = (pdbFrequency * uSec) / (pdbPrescaler * pdbPrescalerMult);

    /* Check if the value belongs to the interval */
    if((intVal_l == 0) || (intVal_l >= (1 << 16)))
    {
        resultValid = false;
        (*intVal) = 0U;
    }
    else
    {
        resultValid = true;
        (*intVal) = (uint16_t)intVal_l;
    }

    return resultValid;
}
