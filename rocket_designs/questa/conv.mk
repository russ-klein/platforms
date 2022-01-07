CONV=        $(DESIGNS)/conv
SW=          $(CONV)/sw
HW=          $(CONV)/hw
CAT=         $(CONV)/cat
COMMON=      $(DESIGNS)/common

compile_conv: $(markers)/cat_conv $(markers)/conv compile

CONV_DEPS  = $(SW)/conv_test.c      \
             $(SW)/conv_test.h      \
             $(SW)/hw_conv.c        \
             $(SW)/hw_conv.h        \
             $(SW)/sw_conv.c        \
             $(SW)/sw_conv.c        \
             $(COMMON)/console.c    \
             $(COMMON)/console.h    \
             $(COMMON)/start.s

$(SW)/conv_test.mem: $(CONV_DEPS)
	@echo "MAKE    conv_test.mem"
	make -C $(CONV)/sw conv_test.mem $(QUIET_FLAG) 

BOOT_DEPS  = $(COMMON)/bootrom.s 
             
$(SW)/bootrom.mem: $(BOOT_DEPS)
	@echo "MAKE    bootrom.mem"
	@make -C $(CONV)/sw bootrom.mem $(QUIET_FLAG) 


run_conv: $(CONV)/sw/conv_test.mem $(SW)/bootrom.mem compile_conv run.do.template terminal.so rocket_lib $(TERMINAL)/bin/terminal_emulator
	@sed -e "s-APP_CODE-$(SW)/conv_test.mem-" run.do.template | sed -e "s-BOOT_CODE-$(SW)/bootrom.mem-" > run.do
	@rm run.do.template
	@echo "VSIM    tbench"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

#=== CONV accelerator

CONV_DEPS  = $(CAT)/conv.cpp $(CAT)/conv.tcl 

$(HW)/conv.v: $(CONV_DEPS)
	@echo "MAKE    accelerator"
	@make -C $(CONV)/cat ../hw/conv.v $(QUIET_FLAG) 

IFC_DEPS   = $(CAT)/conv.spec

$(HW)/cat_conv.v: $(IFC_DEPS)
	@echo "MAKE    accelerator"
	@make -C $(CONV)/cat ../hw/cat_conv.v $(QUIET_FLAG) 

$(markers)/conv: $(HW)/conv.v  $(markers)
	@echo "VLOG    conv.v"
	@$(VLOG) $(VLOG_FLAGS) $(HW)/conv.v >> make.out
	@touch $(markers)/conv

$(markers)/cat_conv: $(HW)/cat_conv.v $(markers)
	@echo "VLOG    cat_conv.v"
	@$(VLOG) $(VLOG_FLAGS) $(HW)/cat_conv.v >> make.out
	@touch $(markers)/cat_conv

clean_conv:
	@echo "Removing created files and cruft"
	@make clean $(QUIET_FLAG)
	@make -C $(CONV)/sw clean $(QUIET_FLAG)
	@make -C $(CONV)/cat clean $(QUIET_FLAG)
