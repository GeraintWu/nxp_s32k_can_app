################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../../../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/devices/startup.c" \

C_SRCS += \
C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/devices/startup.c \

C_DEPS_QUOTED += \
"./SDK/platform/devices/startup.d" \

OBJS_QUOTED += \
"./SDK/platform/devices/startup.o" \

C_DEPS += \
./SDK/platform/devices/startup.d \

OBJS_OS_FORMAT += \
./SDK/platform/devices/startup.o \

OBJS += \
./SDK/platform/devices/startup.o \


# Each subdirectory must supply rules for building sources it contributes
SDK/platform/devices/startup.o: C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/devices/startup.c
	@echo 'Building file: $<'
	@echo 'Executing target #9 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@SDK/platform/devices/startup.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "SDK/platform/devices/startup.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


