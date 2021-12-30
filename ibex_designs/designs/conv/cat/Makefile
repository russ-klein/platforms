#========== Location Specific Settings ==========#

CATAPULT_HOME ?= /wv/hlsb/CATAPULT/10.6a/PRODUCTION/aol/Mgc_home
IF_GEN_HOME   ?= ../../../if_gen

#================================================#

CCS     = $(CATAPULT_HOME)/bin/catapult -prod ultra
IF_GEN  = $(IF_GEN_HOME)/if_gen

all: ../hw/conv.v ../hw/cat_conv.v ../sw/conv.h 

../hw/conv.v: conv.spec
	@echo "IFGEN   conv.spec"
	@$(IF_GEN) conv conv.spec 0x70000000
	@mv conv.v ../hw
	@cp conv.h ../sw

../sw/conv.h: conv.spec
	@echo "IFGEN   conv.spec"
	@$(IF_GEN) conv conv.spec 0x70000000
	@mv conv.v ../hw
	@cp conv.h ../sw

../hw/cat_conv.v: Catapult/conv.v1/concat_rtl.v
	@echo "MV      Catapult/conv.v1/concat_rtl.v ../hw/cat_conv.v"
	@cp Catapult/conv.v1/concat_rtl.v ../hw/cat_conv.v

Catapult/conv.v1/concat_rtl.v: conv.cpp conv.tcl
	@echo "CAT     -f conv.tcl "
	@rm -rf Catapult*
	@$(CCS) -f conv.tcl -s >> make.out

clean:
	@rm -rf catapult.log design_checker_* Catapult* ../hw/conv.v ../hw/cat_conv.v ../sw/conv.h
	@echo "Removing created files and cruft"

