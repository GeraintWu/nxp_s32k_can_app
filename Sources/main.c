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
/* ###################################################################
**     Filename    : main.c
**     Project     : pdb_periodic_interrupt_s32k142
**     Processor   : S32K142_100
**     Version     : Driver 01.00
**     Compiler    : GNU C Compiler
**     Date/Time   : 2017-07-24, 14:09, # CodeGen: 0
**     Abstract    :
**         Main module.
**         This module contains user's application code.
**     Settings    :
**     Contents    :
**         No public methods
**
** ###################################################################*/
/*!
** @file main.c
** @version 01.00
** @brief
**         Main module.
**         This module contains user's application code.
*/
/*!
**  @addtogroup main_module main module documentation
**  @{
*/
/* MODULE main */

/* Including needed modules to compile this module/procedure */
#include "Cpu.h"
#include "pin_mux.h"
#include "pdly1.h"
#include "clockMan1.h"
#include "can_user_if.h"
#include "string.h"

volatile int exit_code = 0;
/* User includes (#include below this line is not maintained by Processor Expert) */

#include <stdint.h>
#include <stdbool.h>

#define TIMEOUT   1000000UL /* 1 second interval */

#define LED_PIN   16U   /* LED pin on PTD16 for the EVB Board */
#define LED_GPIO  PTD

#define LED_PIN_8 15U
#define LED_GPIO_PTD PTD

#include "helper_functions.h"



extern can_message_t        g_recvMsg;
extern can_message_t        g_sendMsg;
extern bool                 g_can_tx_complete;
extern bool                 g_can_rx_complete;
extern const can_msg_commnad_t g_can_tx_msg_cmd[];
extern const can_msg_commnad_t g_can_rx_msg_cmd[];

/* brief: PDB instance ISR
 * This handler will toggle the led when
 * the PDB generates an IRQ
 */
void PDB_IRQHandler(void)
{
  /* Clear PDB instance Interrupt flag */
  PDB_DRV_ClearTimerIntFlag(INST_PDLY1);
  /* Toggle the LED */
#if 0
  PINS_DRV_TogglePins(LED_GPIO, (uint32_t) (1 << LED_PIN));
#else
  PINS_DRV_TogglePins(LED_GPIO_PTD, (uint32_t) (1 << LED_PIN_8));
#endif
}

/* Assign the PDB ISR to the instance used */
void PDB0_IRQHandler(void)
{
  PDB_IRQHandler();
}

/*!
  \brief The main function for the project.
  \details The startup initialization sequence is the following:
 * - startup asm routine
 * - main()
*/
int main(void)
{
  /* Write your local variable definition here */
  uint16_t pdbIntValue;
  /*** Processor Expert internal initialization. DON'T REMOVE THIS CODE!!! ***/
  #ifdef PEX_RTOS_INIT
    PEX_RTOS_INIT();                   /* Initialization of the selected RTOS. Macro is defined by the RTOS component. */
  #endif
  /*** End of Processor Expert internal initialization.                    ***/

    /* Initialize and configure clocks
   *  - see clock manager component for details
   */
    CLOCK_SYS_Init(g_clockManConfigsArr, CLOCK_MANAGER_CONFIG_CNT, g_clockManCallbacksArr, CLOCK_MANAGER_CALLBACK_CNT);
    CLOCK_SYS_UpdateConfiguration(0U, CLOCK_MANAGER_POLICY_AGREEMENT);

  /* Initialize pins
   *  - See PinSettings component for more info
   */
    PINS_DRV_Init(NUM_OF_CONFIGURED_PINS, g_pin_mux_InitConfigArr);

    init_can();
    /* Calculate the value needed for PDB instance
     * to generate an interrupt at a specified timeout.
     * If the value can not be reached, stop the application flow
     */
    if(!calculateIntValue(&pdly1_InitConfig0, TIMEOUT, &pdbIntValue))
    {
      /* Stop the application flow */
      while(1);
    }

    /* Initialize PDB instance with the configuration structure
     *  - See PEx component for more details
     */
    PDB_DRV_Init(INST_PDLY1, &pdly1_InitConfig0);
#if 0
    /* Set direction for GPIO */
    PINS_DRV_SetPinDirection(LED_GPIO, LED_PIN, 1);
    /* Clear output logic on selected pin */
    PINS_DRV_ClearPins(LED_GPIO, (uint32_t) (1 << LED_PIN));
#else
    /* Set direction for GPIO */
    PINS_DRV_SetPinDirection(LED_GPIO_PTD, LED_PIN_8, 1);
    /* Clear output logic on selected pin */
    PINS_DRV_ClearPins(LED_GPIO_PTD, (uint32_t) (1 << LED_PIN_8));
#endif
    /* Set the calculated values to PDB interrupt and modulus registers */
    PDB_DRV_SetTimerModulusValue(INST_PDLY1, pdbIntValue);
    PDB_DRV_SetValueForTimerInterrupt(INST_PDLY1, pdbIntValue);
    PDB_DRV_Enable(INST_PDLY1);
    /* Command the PDB instance to load the fresh values */
    PDB_DRV_LoadValuesCmd(INST_PDLY1);
    /* Software trigger the counter */
    PDB_DRV_SoftTriggerCmd(INST_PDLY1);

    /* Infinite loop
     * Do nothing, when the timeout is reached it generates an
     * interrupt which toggles a led.
     */

    memset(&g_recvMsg, 0, sizeof(can_message_t));
	g_can_rx_complete = 0;
	CAN_Receive(&can_pal1_instance, g_can_rx_msg_cmd[0].messagebox,  &g_recvMsg);

    while(1)
    {
        if(g_can_rx_complete)
        {
        	g_can_rx_complete = 0;
        	CAN_Receive(&can_pal1_instance, g_can_rx_msg_cmd[0].messagebox,  &g_recvMsg);
        }

    	//if(g_can_rx_complete && (g_recvMsg.id == rx_flash_update))
    	if(g_recvMsg.id == rx_flash_update)
    	{
    		g_can_rx_complete = 0;
    		g_sendMsg.id = tx_flash_update_ack;
    		g_sendMsg.length = 1;
    		g_sendMsg.data[0] = (uint8_t)0;

    		g_can_tx_complete = false;
    		CAN_Send(&can_pal1_instance, g_can_tx_msg_cmd[0].messagebox, &g_sendMsg);
    		for(;;) {
    		  if(g_can_tx_complete == true)
    			  SystemSoftwareReset();
    		  __asm__ ("NOP");
    		}
    	}
//        while(++i % 8);
//    	__asm__ ("NOP");
//        __asm__ ("NOP");
//        __asm__ ("NOP");

    }
  /*** Don't write any code pass this line, or it will be deleted during code generation. ***/
  /*** RTOS startup code. Macro PEX_RTOS_START is defined by the RTOS component. DON'T MODIFY THIS CODE!!! ***/
  #ifdef PEX_RTOS_START
    PEX_RTOS_START();                  /* Startup of the selected RTOS. Macro is defined by the RTOS component. */
  #endif
  /*** End of RTOS startup code.  ***/
  /*** Processor Expert end of main routine. DON'T MODIFY THIS CODE!!! ***/
  for(;;) {
    if(exit_code != 0) {
      break;
    }
  }
  return exit_code;
  /*** Processor Expert end of main routine. DON'T WRITE CODE BELOW!!! ***/
} /*** End of main routine. DO NOT MODIFY THIS TEXT!!! ***/

/* END main */
/*!
** @}
*/
/*
** ###################################################################
**
**     This file was created by Processor Expert 10.1 [05.21]
**     for the Freescale S32K series of microcontrollers.
**
** ###################################################################
*/
