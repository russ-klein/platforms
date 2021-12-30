#===== Location specific settings ========#

RISCV_GCC_HOME ?= /home/russk/platforms/catapult_cpu_platforms/riscv-tools/riscv-gcc/

#=========================================#

AS = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-as
CC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-gcc
LD = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-ld
OC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-objcopy

COMMON = ../../common

ASFLAGS= -a -march rv32imc
CCFLAGS=
LDFLAGS= -m elf32lriscv --script $(COMMON)/link.ld -Map fib.map

fib.mem : fib.bin
	@echo "OD      fib.bin > fib.mem"
	@od --address-radix=x --output-duplicates --format=x4 --width=4 fib.bin | \
	 cut -c7- > fib.mem

fib.bin: fib.x
	@echo "OBJCOPY -O binary fib.x fib.bin"
	@$(OC) -O binary fib.x fib.bin

fib.x: fib.o
	@echo "LD      -o fib.x fib.o"
	@$(LD) $(LDFLAGS) -o fib.x fib.o

fib.o: fib.s
	@echo "AS      -o fib.o -c fib.s"
	@$(AS) $(ASFLAGS) -o fib.o -c fib.s > fib.list
	
clean:
	@echo "Removing created files and cruft"
	@rm -f fib.mem fib.bin fib.x fib.o fib.map fib.list
