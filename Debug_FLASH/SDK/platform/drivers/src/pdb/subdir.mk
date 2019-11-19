################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../../../../../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/pdb/pdb_driver.c" \
"C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/pdb/pdb_hw_access.c" \

C_SRCS += \
C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/pdb/pdb_driver.c \
C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/pdb/pdb_hw_access.c \

C_DEPS_QUOTED += \
"./SDK/platform/drivers/src/pdb/pdb_driver.d" \
"./SDK/platform/drivers/src/pdb/pdb_hw_access.d" \

OBJS_QUOTED += \
"./SDK/platform/drivers/src/pdb/pdb_driver.o" \
"./SDK/platform/drivers/src/pdb/pdb_hw_access.o" \

C_DEPS += \
./SDK/platform/drivers/src/pdb/pdb_driver.d \
./SDK/platform/drivers/src/pdb/pdb_hw_access.d \

OBJS_OS_FORMAT += \
./SDK/platform/drivers/src/pdb/pdb_driver.o \
./SDK/platform/drivers/src/pdb/pdb_hw_access.o \

OBJS += \
./SDK/platform/drivers/src/pdb/pdb_driver.o \
./SDK/platform/drivers/src/pdb/pdb_hw_access.o \


# Each subdirectory must supply rules for building sources it contributes
SDK/platform/drivers/src/pdb/pdb_driver.o: C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/pdb/pdb_driver.c
	@echo 'Building file: $<'
	@echo 'Executing target #19 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@SDK/platform/drivers/src/pdb/pdb_driver.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "SDK/platform/drivers/src/pdb/pdb_driver.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

SDK/platform/drivers/src/pdb/pdb_hw_access.o: C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/drivers/src/pdb/pdb_hw_access.c
	@echo 'Building file: $<'
	@echo 'Executing target #20 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@SDK/platform/drivers/src/pdb/pdb_hw_access.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "SDK/platform/drivers/src/pdb/pdb_hw_access.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


