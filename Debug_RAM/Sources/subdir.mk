################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"../Sources/helper_functions.c" \
"../Sources/main.c" \

C_SRCS += \
../Sources/helper_functions.c \
../Sources/main.c \

OBJS_OS_FORMAT += \
./Sources/helper_functions.o \
./Sources/main.o \

C_DEPS_QUOTED += \
"./Sources/helper_functions.d" \
"./Sources/main.d" \

OBJS += \
./Sources/helper_functions.o \
./Sources/main.o \

OBJS_QUOTED += \
"./Sources/helper_functions.o" \
"./Sources/main.o" \

C_DEPS += \
./Sources/helper_functions.d \
./Sources/main.d \


# Each subdirectory must supply rules for building sources it contributes
Sources/helper_functions.o: ../Sources/helper_functions.c
	@echo 'Building file: $<'
	@echo 'Executing target #15 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/helper_functions.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Sources/helper_functions.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Sources/main.o: ../Sources/main.c
	@echo 'Building file: $<'
	@echo 'Executing target #16 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/main.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Sources/main.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


