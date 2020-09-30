
C_SRCS := Drivers/Source/system_ADuCM3029.c \
		Drivers/Source/GCC/startup_ADuCM3029.c \
		Drivers/Source/drivers/pwr/adi_pwr.c \
		$(foreach PERH,$(PERIPHS), $(addprefix Drivers/Source/drivers/,$(addsuffix $(PERH).c, $(addsuffix /adi_,$(PERH)))))
						
A_SRCS := Drivers/Source/GCC/reset_ADuCM3029.S

ifndef DFP_FOLDER
	DFP_FOLDER = ADuCM302x_DFP
endif

OBJS = 	$(addsuffix .o, $(addprefix $(DFP_FOLDER)/,$(basename $(C_SRCS)))) \
		$(addsuffix .o, $(addprefix $(DFP_FOLDER)/,$(basename $(A_SRCS))))

				
INC_DIRS = $(DFP_FOLDER)/ARM_CMSIS/Include \
			$(DFP_FOLDER)/Drivers/Include \
			$(DFP_FOLDER)/Drivers/Include/config \
			$(DFP_FOLDER)/Drivers/Include/sys \
			$(COMPILER_PATH)arm-none-eabi/include

MCFLAGS := -mcpu=cortex-m4 \
		   -mthumb \
		   
		   
DEFS	:= -D__ADUCM3029__ \
		   -DADI_DEBUG
		   
LDSCRIPT:= $(DFP_FOLDER)/Drivers/Source/GCC/ADuCM3029.ld

	   

			
			