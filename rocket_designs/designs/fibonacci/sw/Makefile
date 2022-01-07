#===== Location specific settings ========#

RISCV_GCC_HOME ?= /home/russk/platforms/catapult_cpu_platforms/riscv-tools/riscv-gcc/

#=========================================#

AS = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-as
CC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-gcc
LD = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-ld
OC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-objcopy

COMMON = ../../common

ASFLAGS= -a -march=rv64imaf -mabi=lp64
CCFLAGS= -march=rv64imaf -mabi=lp64 -O0 -g -fPIC -I $(COMMON)
LDFLAGS= -m elf64lriscv

all: fib.mem bootrom.mem

fib.mem : fib.bin
	@echo "OD      fib.bin > fib.mem"
	@od --address-radix=x --output-duplicates --format=x8 --width=8 fib.bin | \
	 cut -c7- > fib.mem

fib.bin: fib.x
	@echo "OBJCOPY fib.x fib.bin"
	@$(OC) -O binary fib.x fib.bin >> make.out

fib.x: fib.o
	@echo "LD      -o fib.x"
	@$(LD) $(LDFLAGS) -o fib.x fib.o >> make.out

fib.o: fib.s
	@echo "AS      fib.s"
	@$(AS) $(ASFLAGS) -o fib.o -c fib.s > fib.list

bootrom.mem : bootrom.bin
	@echo "OD      bootrom.bin > bootrom.mem"
	@od --address-radix=x --output-duplicates --format=x8 --width=8 bootrom.bin | \
	 cut -c7- > temp.mem
	@cat $(COMMON)/fat.mem temp.mem > bootrom.mem
	@rm temp.mem

bootrom.bin: bootrom.x
	@echo "OBJCOPY bootrom.x bootrom.bin"
	@$(OC) -O binary bootrom.x bootrom.bin

bootrom.x: bootrom.o
	@echo "LD      -o bootrom.x"
	@$(LD) $(LDFLAGS) -o bootrom.x bootrom.o --script $(COMMON)/bootrom.ld 

bootrom.o: $(COMMON)/bootrom.s
	@echo "AS      bootrom.s"
	@$(AS) $(ASFLAGS) -o bootrom.o -c $(COMMON)/bootrom.s > bootrom.list

clean:
	@echo "Removing created files and cruft"
	@rm -f fib.mem fib.bin fib.x fib.o fib.map fib.list make.out bootrom.o bootrom.x bootrom.bin bootrom.list bootrom.mem
