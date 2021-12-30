
#===== Location specific settings ========#

RISCV_GCC_HOME  ?= /home/russk/platforms/catapult_cpu_platforms/riscv-tools/riscv-gcc/

#=========================================#

PROGRAM          = conv_test

AS               = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-as
CC               = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-gcc
LD               = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-ld
GCC_AS_LD        = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-gcc
OC               = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-objcopy
LIB_DIR          = $(RISCV_GCC_HOME)/lib/gcc/riscv64-unknown-elf/8.2.0

COMMON           = ../../common

ARCH             = rv32imc
#ARCH             = rv32i
ABI              = ilp32e
#ABI              = ilp32

ASFLAGS          = -a -march=$(ARCH)
CCFLAGS          = -mabi=$(ABI) -march=$(ARCH) -I $(COMMON) -O3
LDFLAGS          = -m elf32lriscv --script $(COMMON)/link.ld -Map $(PROGRAM).map -L $(LIB_DIR)/$(ARCH)/$(ABI)/libgcc.a
GCC_AS_LDFLAGS   = -Xlinker -m -Xlinker elf32lriscv -Xlinker --script -Xlinker $(COMMON)/link.ld -Xlinker -Map -Xlinker $(PROGRAM).map

OBJS             = start.o conv_test.o console.o hw_conv.o sw_conv.o


$(PROGRAM).mem : $(PROGRAM).bin
	@echo "OD      $(PROGRAM).bin > $(PROGRAM).mem"
	@od --address-radix=x --output-duplicates --format=x4 --width=4 $(PROGRAM).bin | \
	 cut -c7- > $(PROGRAM).mem

$(PROGRAM).bin: $(PROGRAM).x
	@echo "OBJCOPY $(PROGRAM).x $(PROGRAM).bin"
	@$(OC) -O binary $(PROGRAM).x $(PROGRAM).bin >> make.out

$(PROGRAM).x: $(OBJS)
	@echo "LD      -o $(PROGRAM).x"
	@$(LD) $(LDFLAGS) -o $(PROGRAM).x $(OBJS) >> make.out

conv.h:
	@make -C ../cat ../sw/conv.h $(QUIET_FLAG)

$(PROGRAM).o: $(PROGRAM).c conv.h $(COMMON)/console.h hw_conv.h sw_conv.h
	@echo "CC      -c $(PROGRAM).c"
	@$(CC) $(CCFLAGS) -o $(PROGRAM).o -c $(PROGRAM).c  >> make.out
	
console.o: $(COMMON)/console.c
	@echo "CC      -c console.c"
	@$(CC) $(CCFLAGS) -o console.o -c $(COMMON)/console.c  >> make.out
	
hw_conv.o: hw_conv.c hw_conv.h
	@echo "CC      -c hw_conv.c"
	@$(CC) $(CCFLAGS) -o hw_conv.o -c hw_conv.c  >> make.out
	
sw_conv.o: sw_conv.c sw_conv.h
	@echo "CC      -c sw_conv.c"
	@$(CC) $(CCFLAGS) -o sw_conv.o -c sw_conv.c  >> make.out
	
start.o: $(COMMON)/start.s
	@echo "AS      start.s"
	@$(CC) $(CCFLAGS) -o start.o -c $(COMMON)/start.s >> make.out

clean:
	@echo "Removing created files and cruft"
	@rm -f $(PROGRAM).mem $(PROGRAM).bin $(PROGRAM).x $(OBJS) $(PROGRAM).map $(PROGRAM).list make.out

