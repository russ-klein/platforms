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

QUIET_FLAG = --no-print-directory

OBJS= start.o sw_conv.o hw_conv.o conv_test.o console.o

all: conv_test.mem bootrom.mem

conv_test.mem : conv_test.bin
	@echo "OD      conv_test.bin > conv_test.mem "
	@od --address-radix=x --output-duplicates --format=x8 --width=8 conv_test.bin | \
	 cut -c7- > conv_test.mem  2>> make.out

conv_test.bin: conv_test.x
	@echo "OBJCOPY conv_test.c conv_test.x "
	@$(OC) -O binary conv_test.x conv_test.bin &>> make.out

conv_test.x: $(OBJS)
	@echo "LD      -o conv_test.x "
	@$(LD) $(LDFLAGS) -o conv_test.x $(OBJS) --script $(COMMON)/link.ld -Map conv_test.map &>> make.out

conv.h:
	@echo "MAKE    conv.h "
	@make -C ../cat ../sw/conv.h $(QUIET_FLAG)

conv_test.o: conv_test.c conv.h $(COMMON)/console.h
	@echo "CC      conv_test.c "
	@$(CC) $(CCFLAGS) -o conv_test.o -c conv_test.c &>> make.out 
	
sw_conv.o: sw_conv.c conv.h $(COMMON)/console.h
	@echo "CC      sw_conv.c "
	@$(CC) $(CCFLAGS) -o sw_conv.o -c sw_conv.c &>> make.out
	
hw_conv.o: hw_conv.c conv.h $(COMMON)/console.h
	@echo "CC      hw_conv.c "
	@$(CC) $(CCFLAGS) -o hw_conv.o -c hw_conv.c  &>> make.out
	
console.o: $(COMMON)/console.c
	@echo "CC      console.c "
	@$(CC) $(CCFLAGS) -o console.o -c $(COMMON)/console.c  &>>make.out
	
start.o: $(COMMON)/start.s
	@echo "AS      start.s "
	@$(AS) $(ASFLAGS) -o start.o -c $(COMMON)/start.s > start.list 2>> make.out

bootrom.mem : bootrom.bin
	@echo "OD      bootrom.bin > bootrom.mem "
	@od --address-radix=x --output-duplicates --format=x8 --width=8 bootrom.bin | \
	 cut -c7- > temp.mem 2>> make.out
	@cat $(COMMON)/fat.mem temp.mem > bootrom.mem 2>> make.out
	@rm temp.mem &>> make.out

bootrom.bin: bootrom.x
	@echo "OBJCOPY bootrom.x bootrom.bin "
	@$(OC) -O binary bootrom.x bootrom.bin &>> make.out

bootrom.x: bootrom.o
	@echo "LD      -o bootrom.x "
	@$(LD) $(LDFLAGS) -o bootrom.x bootrom.o --script $(COMMON)/bootrom.ld &>> make.out

bootrom.o: $(COMMON)/bootrom.s
	@echo "AS      bootrom.s "
	@$(AS) $(ASFLAGS) -o bootrom.o -c $(COMMON)/bootrom.s > bootrom.list 2>> make.out


clean:
	@echo "Removing created files and cruft "
	@rm -f bootrom.mem    \
               bootrom.bin    \
               bootrom.x      \
               bootrom.o      \
               bootrom.map    \
               bootrom.list   \
               conv_test.mem  \
               conv_test.bin  \
               conv_test.x    \
               conv_test.map  \
               $(OBJS)        \
               start.list     \
               make.out


