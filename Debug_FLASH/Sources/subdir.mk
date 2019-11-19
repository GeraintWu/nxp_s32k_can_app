################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.local

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS_QUOTED += \
"../Sources/can_user_if.c" \
"../Sources/helper_functions.c" \
"../Sources/main.c" \

C_SRCS += \
../Sources/can_user_if.c \
../Sources/helper_functions.c \
../Sources/main.c \

C_DEPS_QUOTED += \
"./Sources/can_user_if.d" \
"./Sources/helper_functions.d" \
"./Sources/main.d" \

OBJS_QUOTED += \
"./Sources/can_user_if.o" \
"./Sources/helper_functions.o" \
"./Sources/main.o" \

C_DEPS += \
./Sources/can_user_if.d \
./Sources/helper_functions.d \
./Sources/main.d \

OBJS_OS_FORMAT += \
./Sources/can_user_if.o \
./Sources/helper_functions.o \
./Sources/main.o \

OBJS += \
./Sources/can_user_if.o \
./Sources/helper_functions.o \
./Sources/main.o \


# Each subdirectory must supply rules for building sources it contributes
Sources/can_user_if.o: ../Sources/can_user_if.c
	@echo 'Building file: $<'
	@echo 'Executing target #25 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/can_user_if.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Sources/can_user_if.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Sources/helper_functions.o: ../Sources/helper_functions.c
	@echo 'Building file: $<'
	@echo 'Executing target #26 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/helper_functions.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Sources/helper_functions.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Sources/main.o: ../Sources/main.c
	@echo 'Building file: $<'
	@echo 'Executing target #27 $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@Sources/main.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "Sources/main.o" "$<"
	@echo 'Finished building: $<'
	@echo ' '


