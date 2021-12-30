
#========== Location Specific Settings ==========#

CATAPULT_HOME ?= /wv/hlsb/CATAPULT/10.5c/PRODUCTION/aol/Mgc_home
IF_GEN_HOME   ?= ../../../if_gen

#================================================#

CCS     = $(CATAPULT_HOME)/bin/catapult -prod ultra
IF_GEN  = $(IF_GEN_HOME)/if_gen

all: ../hw/mac.v ../hw/cat_mac.v ../sw/mac.h 

../hw/mac.v: mac.spec
	@echo "IFGEN   mac.spec"
	@$(IF_GEN) mac mac.spec 0x70000000
	@mv mac.v ../hw
	@mv mac.h ../sw

../sw/mac.h: mac.spec
	@echo "IFGEN   mac.spec"
	@$(IF_GEN) mac mac.spec 0x70000000
	@mv mac.v ../hw
	@mv mac.h ../sw

../hw/cat_mac.v: Catapult/mac.v1/concat_rtl.v
	@echo "MV      Catapult/mac.v1/concat_rtl.v ../hw/cat_mac.v"
	@cp Catapult/mac.v1/concat_rtl.v ../hw/cat_mac.v

Catapult/mac.v1/concat_rtl.v: mac.cpp mac.tcl
	@echo "CAT     -f mac.tcl "
	@rm -rf Catapult*
	@$(CCS) -f mac.tcl -s >> make.out

clean:
	@echo "Removing created files and cruft"
	@rm -rf catapult.log design_checker_* Catapult* ../hw/mac.v ../hw/cat_mac.v ../sw/mac.h make.out
