
C_SRCS := Drivers/Source/system_ADuCM3029.c \
		Drivers/Source/GCC/startup_ADuCM3029.c \
		Drivers/Source/drivers/pwr/adi_pwr.c \
		$(foreach PERH,$(PERIPHS), $(addprefix Drivers/Source/drivers/,$(addsuffix $(PERH).c, $(addsuffix /adi_,$(PERH)))))
						
A_SRCS := Drivers/Source/GCC/reset_ADuCM3029.S

OBJS = 	$(addsuffix .o, $(addprefix $(MUSKA_DFP)/,$(basename $(C_SRCS)))) \
		$(addsuffix .o, $(addprefix $(MUSKA_DFP)/,$(basename $(A_SRCS))))

				
INC_DIRS = $(MUSKA_DFP)/ARM_CMSIS/Include \
			$(MUSKA_DFP)/Drivers/Include \
			$(MUSKA_DFP)/Drivers/Include/config \
			$(MUSKA_DFP)/Drivers/Include/sys \
			$(COMPILER_PATH)arm-none-eabi/include

MCFLAGS := -mcpu=cortex-m4 \
		   -mthumb \
		   
		   
DEFS	:= -D__ADUCM3029__ \
		   -DADI_DEBUG
		   
LDSCRIPT:= $(MUSKA_DFP)/Drivers/Source/GCC/ADuCM3029.ld

	   

			
			