################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../../../../../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/pal/can/src/can_pal.c" \

C_SRCS += \
C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/pal/can/src/can_pal.c \

C_DEPS_QUOTED += \
"./SDK/platform/pal/can/src/can_pal.d" \

OBJS_QUOTED += \
"./SDK/platform/pal/can/src/can_pal.o" \

C_DEPS += \
./SDK/platform/pal/can/src/can_pal.d \

OBJS_OS_FORMAT += \
./SDK/platform/pal/can/src/can_pal.o \

OBJS += \
./SDK/platform/pal/can/src/can_pal.o \


# Each subdirectory must supply rules for building sources it contributes
SDK/platform/pal/can/src/can_pal.o: C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/pal/can/src/can_pal.c
	@echo 'Building file: $<'
	@echo 'Executing target #23 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@SDK/platform/pal/can/src/can_pal.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "SDK/platform/pal/can/src/can_pal.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


