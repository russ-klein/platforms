
#===== Location specific settings ========#

RISCV_GCC_HOME ?= /home/russk/platforms/catapult_cpu_platforms/riscv-tools/riscv-gcc/

#=========================================#

AS = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-as
CC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-gcc
LD = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-ld
OC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-objcopy

COMMON = ../../common

ASFLAGS= -a -march=rv32imc
CCFLAGS= -mabi=ilp32e -march=rv32imc -I $(COMMON)
LDFLAGS= -m elf32lriscv --script $(COMMON)/link.ld -Map hello.map

OBJS= start.o hello.o console.o 

hello.mem : hello.bin
	@echo "OD       hello.bin > hello.mem"
	@od --address-radix=x --output-duplicates --format=x4 --width=4 hello.bin | \
	cut -c7- > hello.mem

hello.bin: hello.x
	@echo "OBJCOPY  -O binary hello.x hello.bin"
	@$(OC) -O binary hello.x hello.bin

hello.x: $(OBJS)
	@echo "LD       hello.o"
	@$(LD) $(LDFLAGS) -o hello.x $(OBJS)

hello.o: hello.c
	@echo "CC       hello.c"
	@$(CC) $(CCFLAGS) -o hello.o -c hello.c 
	
console.o: $(COMMON)/console.c
	@echo "CC       console.c"
	@$(CC) $(CCFLAGS) -o console.o -c $(COMMON)/console.c 
	
start.o: $(COMMON)/start.s
	@echo "AS       start.s"
	@$(CC) $(CCFLAGS) -o start.o -c $(COMMON)/start.s

clean:
	@echo "Removing created files and cruft"
	@rm -f hello.mem hello.bin hello.x $(OBJS) hello.map hello.list

