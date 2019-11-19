################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../../../../../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/clock/clock_manager.c" \

C_SRCS += \
C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/clock/clock_manager.c \

C_DEPS_QUOTED += \
"./SDK/platform/drivers/src/clock/clock_manager.d" \

OBJS_QUOTED += \
"./SDK/platform/drivers/src/clock/clock_manager.o" \

C_DEPS += \
./SDK/platform/drivers/src/clock/clock_manager.d \

OBJS_OS_FORMAT += \
./SDK/platform/drivers/src/clock/clock_manager.o \

OBJS += \
./SDK/platform/drivers/src/clock/clock_manager.o \


# Each subdirectory must supply rules for building sources it contributes
SDK/platform/drivers/src/clock/clock_manager.o: C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/clock/clock_manager.c
	@echo 'Building file: $<'
	@echo 'Executing target #11 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@SDK/platform/drivers/src/clock/clock_manager.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "SDK/platform/drivers/src/clock/clock_manager.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


