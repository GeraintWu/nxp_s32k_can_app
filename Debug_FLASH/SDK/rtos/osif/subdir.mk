################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../../../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/rtos/osif/osif_baremetal.c" \

C_SRCS += \
C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/rtos/osif/osif_baremetal.c \

C_DEPS_QUOTED += \
"./SDK/rtos/osif/osif_baremetal.d" \

OBJS_QUOTED += \
"./SDK/rtos/osif/osif_baremetal.o" \

C_DEPS += \
./SDK/rtos/osif/osif_baremetal.d \

OBJS_OS_FORMAT += \
./SDK/rtos/osif/osif_baremetal.o \

OBJS += \
./SDK/rtos/osif/osif_baremetal.o \


# Each subdirectory must supply rules for building sources it contributes
SDK/rtos/osif/osif_baremetal.o: C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/rtos/osif/osif_baremetal.c
	@echo 'Building file: $<'
	@echo 'Executing target #24 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@SDK/rtos/osif/osif_baremetal.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "SDK/rtos/osif/osif_baremetal.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


