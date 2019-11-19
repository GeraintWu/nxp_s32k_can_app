################################################################################
# Automatically-generated file. Do not edit!
################################################################################

#Progress monitor hint: 16
first : all
-include ../makefile.init

# This file contains definitions of environment variables used in the makefiles and .args files if exist.
-include makefile.local

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include subdir.mk
-include Generated_Code/subdir.mk
-include Project_Settings/Linker_Files/subdir.mk
-include Project_Settings/Startup_Code/subdir.mk
-include SDK/platform/devices/S32K118/startup/subdir.mk
-include SDK/platform/devices/subdir.mk
-include SDK/platform/drivers/src/clock/S32K1xx/subdir.mk
-include SDK/platform/drivers/src/clock/subdir.mk
-include SDK/platform/drivers/src/interrupt/subdir.mk
-include SDK/platform/drivers/src/pdb/subdir.mk
-include SDK/platform/drivers/src/pins/subdir.mk
-include Sources/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
pdb_periodic_interrupt_s32K118.elf \

EXECUTABLES_QUOTED += \
"pdb_periodic_interrupt_s32K118.elf" \

EXECUTABLES_OS_FORMAT += \
pdb_periodic_interrupt_s32K118.elf \

SECONDARY_SIZE += \
pdb_periodic_interrupt_s32K118.siz \

SECONDARY_SIZE_QUOTED += \
"pdb_periodic_interrupt_s32K118.siz" \

SECONDARY_SIZE_OS_FORMAT += \
pdb_periodic_interrupt_s32K118.siz \


# All Target
all: warning-messages explicit-dependencies pdb_periodic_interrupt_s32K118.elf secondary-outputs

# Tool invocations
pdb_periodic_interrupt_s32K118.elf: $(OBJS) C:/NXP/S32DS_ARM_v2018.R1/S32DS/S32SDK_S32K118_EAR_1.8.8/platform/devices/S32K118/linker/gcc/S32K118_25_ram.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Executing target #17 $@'
	@echo 'Invoking: Standard S32DS C Linker'
	arm-none-eabi-gcc -o "pdb_periodic_interrupt_s32K118.elf" "@pdb_periodic_interrupt_s32K118.args"  $(USER_OBJS_QUOTED) $(LIBS_QUOTED)
	@echo 'Finished building target: $@'
	@echo ' '

pdb_periodic_interrupt_s32K118.siz: $(EXECUTABLES)
	@echo 'Executing target #18 $@'
	@echo 'Invoking: Standard S32DS Print Size'
	arm-none-eabi-size --format=berkeley $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) ./*/*.d ./*/*/*/*/*/*.d ./*/*/*/*/*/*/*.d ./*/*/*/*.d  ./*/*.o ./*/*/*/*/*/*.o ./*/*/*/*/*/*/*.o ./*/*/*/*.o ./*/*/*.o  $(SECONDARY_SIZE_QUOTED) $(EXECUTABLES_QUOTED)
	-@echo ' '

secondary-outputs: $(SECONDARY_SIZE)

.PHONY: all clean dependents explicit-dependencies warning-messages
.SECONDARY:

-include ../makefile.targets

explicit-dependencies: 

warning-messages: 

