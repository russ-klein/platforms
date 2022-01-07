CCS = catapult -prod ultra
IFGEN = ../../../if_gen/if_gen

all: ../hw/conv.v ../hw/cat_conv.v ../sw/conv.h 

../hw/conv.v: conv.spec
	@echo "IFGEN   conv.spec"
	@$(IFGEN) conv conv.spec 0x60600000
	@echo "        Created conv.v"
	@mv conv.v ../hw
	@echo "        Created conv.h"
	@cp conv.h ../sw

../sw/conv.h: conv.spec
	@echo "IFGEN   conv.spec"
	@$(IFGEN) conv conv.spec 0x60600000
	@echo "        Created conv.v"
	@mv conv.v ../hw
	@echo "        Created conv.h"
	@cp conv.h ../sw

../hw/cat_conv.v: Catapult/conv.v1/concat_rtl.v
	@echo "        Created cat_conv.v"
	@cp Catapult/conv.v1/concat_rtl.v ../hw/cat_conv.v

Catapult/conv.v1/concat_rtl.v: conv.cpp conv.tcl
	@echo "CAT     conv.cpp"
	@$(CCS) -f conv.tcl -s > make.out

clean:
	@echo "Removing created files and cruft"
	@rm -rf catapult.log design_checker_* Catapult* ../hw/conv.v ../hw/cat_conv.v ../sw/conv.h make.out
