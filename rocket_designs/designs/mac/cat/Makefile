CCS = catapult -prod ultra
IFGEN = ../../../if_gen/if_gen

all: ../hw/mac.v ../hw/cat_mac.v ../sw/mac.h 

../hw/mac.v: mac.spec
	@echo "IFGEN   mac.spec"
	@$(IFGEN) mac mac.spec 0x60600000
	@echo "        Created mac.v"
	@mv mac.v ../hw
	@echo "        Created mac.h"
	@mv mac.h ../sw

../sw/mac.h: mac.spec
	@echo "IFGEN   mac.spec"
	@$(IFGEN) mac mac.spec 0x60600000
	@echo "        Created mac.v"
	@mv mac.v ../hw
	@echo "        Created mac.h"
	@mv mac.h ../sw

../hw/cat_mac.v: Catapult/mac.v1/concat_rtl.v
	@echo "        Created cat_mac.v"
	@cp Catapult/mac.v1/concat_rtl.v ../hw/cat_mac.v

Catapult/mac.v1/concat_rtl.v: mac.cpp mac.tcl
	@echo "CAT     mac.cpp"
	@$(CCS) -f mac.tcl -s >> make.out

clean:
	@echo "Removing created files and cruft"
	@rm -rf catapult.log design_checker_* Catapult* ../hw/mac.v ../hw/cat_mac.v ../sw/mac.h make.out
