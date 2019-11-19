################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../../../../../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/devices/S32K118/startup/system_S32K118.c" \

C_SRCS += \
C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/devices/S32K118/startup/system_S32K118.c \

C_DEPS_QUOTED += \
"./SDK/platform/devices/S32K118/startup/system_S32K118.d" \

OBJS_QUOTED += \
"./SDK/platform/devices/S32K118/startup/system_S32K118.o" \

C_DEPS += \
./SDK/platform/devices/S32K118/startup/system_S32K118.d \

OBJS_OS_FORMAT += \
./SDK/platform/devices/S32K118/startup/system_S32K118.o \

OBJS += \
./SDK/platform/devices/S32K118/startup/system_S32K118.o \


# Each subdirectory must supply rules for building sources it contributes
SDK/platform/devices/S32K118/startup/system_S32K118.o: C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/devices/S32K118/startup/system_S32K118.c
	@echo 'Building file: $<'
	@echo 'Executing target #8 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@SDK/platform/devices/S32K118/startup/system_S32K118.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "SDK/platform/devices/S32K118/startup/system_S32K118.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


