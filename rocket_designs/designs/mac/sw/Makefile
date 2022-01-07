#===== Location specific settings ========#

RISCV_GCC_HOME ?= /home/russk/platforms/catapult_cpu_platforms/riscv-tools/riscv-gcc/

#=========================================#

AS = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-as
CC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-gcc
LD = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-ld
OC = $(RISCV_GCC_HOME)/bin/riscv64-unknown-elf-objcopy

COMMON = ../../common

ASFLAGS= -a -march=rv64imaf -mabi=lp64
CCFLAGS= -march=rv64imaf -mabi=lp64 -O3 -fPIC -I $(COMMON)
LDFLAGS= -m elf64lriscv

OBJS= start.o mac_test.o console.o

all: mac_test.mem bootrom.mem

mac_test.mem : mac_test.bin
	@echo "OD      mac_test.bin > mac_test.mem"
	@od --address-radix=x --output-duplicates --format=x8 --width=8 mac_test.bin | \
	 cut -c7- > mac_test.mem

mac_test.bin: mac_test.x
	@echo "OBJCOPY mac_test.x mac_test.bin"
	@$(OC) -O binary mac_test.x mac_test.bin

mac_test.x: $(OBJS)
	@echo "LD      -o mac_test.x"
	@$(LD) $(LDFLAGS) -o mac_test.x $(OBJS) --script $(COMMON)/link.ld -Map mac_test.map

mac.h:
	@echo "MAKE    ../sw/mac.h"
	@make -C ../cat ../sw/mac.h

mac_test.o: mac_test.c mac.h $(COMMON)/console.h
	@echo "CC      mac_test.c"
	@$(CC) $(CCFLAGS) -o mac_test.o -c mac_test.c 
	
console.o: $(COMMON)/console.c
	@echo "CC      console.c"
	@$(CC) $(CCFLAGS) -o console.o -c $(COMMON)/console.c 
	
start.o: $(COMMON)/start.s
	@echo "AS      start.s"
	@$(AS) $(ASFLAGS) -o start.o -c $(COMMON)/start.s > start.list

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
	@rm -f bootrom.mem bootrom.bin bootrom.x bootrom.o bootrom.map bootrom.list mac_test.mem mac_test.bin mac_test.x mac_test.map $(OBJS) start.list


