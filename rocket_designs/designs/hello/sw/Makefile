#===== Location specific settings ========#

RISCV_GCC_HOME ?= /home/russk/platforms/catapult_cpu_platforms/riscv-tools/riscv-gcc/

#=========================================#

AS = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-as
CC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-gcc
LD = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-ld
OC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-objcopy

COMMON = ../../common

#ASFLAGS= -a -march=rv32imaf -mabi=ilp32
#CCFLAGS= -march=rv32imaf -mabi=ilp32 -O0 -g 
#LDFLAGS= -m elf32lriscv 

ASFLAGS= -a -march=rv64imaf -mabi=lp64
CCFLAGS= -march=rv64imaf -mabi=lp64 -O0 -g -fPIC -I $(COMMON)
LDFLAGS= -m elf64lriscv 


all: bootrom.mem hello.mem

hello.mem : hello.bin
	@echo "OD      hello.bin > hello.mem"
	@od --address-radix=x --output-duplicates --format=x8 --width=8 hello.bin | \
	 cut -c7- > hello.mem

hello.bin: hello.x
	@echo "OBJCOPY hello.x hello.bin"
	@$(OC) -O binary hello.x hello.bin >> make.out

hello.x: hello.o console.o start.o
	@echo "LD      -o hello.x"
	@$(LD) $(LDFLAGS) -o hello.x start.o hello.o console.o --script $(COMMON)/link.ld  >> make.out

hello.o: hello.c $(COMMON)/console.h
	@echo "CC      hello.c"
	@$(CC) $(CCFLAGS) -o hello.o -c hello.c >> make.out
	
console.o: $(COMMON)/console.c $(COMMON)/console.h
	@echo "CC      console.c"
	@$(CC) $(CCFLAGS) -o console.o -c $(COMMON)/console.c >> make.out

start.o: $(COMMON)/start.s
	@echo "AS      start.s"
	@$(AS) $(ASFLAGS) -o start.o -c $(COMMON)/start.s > start.list >> make.out
	
bootrom.mem : bootrom.bin
	@echo "OD      bootrom.bin > bootrom.mem"
	@od --address-radix=x --output-duplicates --format=x8 --width=8 bootrom.bin | \
	 cut -c7- > temp.mem
	@cat $(COMMON)/fat.mem temp.mem > bootrom.mem
	@rm temp.mem

bootrom.bin: bootrom.x
	@echo "OBJCOPY bootrom.x bootrom.bin"
	@$(OC) -O binary bootrom.x bootrom.bin >> make.out

bootrom.x: bootrom.o
	@echo "LD      bootrom.x"
	@$(LD) $(LDFLAGS) -o bootrom.x bootrom.o --script $(COMMON)/bootrom.ld  >> make.out

bootrom.o: $(COMMON)/bootrom.s
	@echo "AS      bootrom.s"
	@$(AS) $(ASFLAGS) -o bootrom.o -c $(COMMON)/bootrom.s > bootrom.list
	
	
clean:
	@echo "Removing created files and cruft"
	@rm -f bootrom.mem bootrom.bin bootrom.x bootrom.o bootrom.map bootrom.list hello.mem hello.bin hello.x hello.o console.o start.o start.list make.out
