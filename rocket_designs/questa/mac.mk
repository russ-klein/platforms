MAC=         $(DESIGNS)/mac
SW=          $(MAC)/sw
HW=          $(MAC)/hw
CAT=         $(MAC)/cat
COMMON=      $(DESIGNS)/common


compile_mac: $(markers)/cat_mac $(markers)/mac compile

MAC_DEPS     = $(SW)/mac_test.c       \
               $(COMMON)/console.c    \
               $(COMMON)/console.h    \
               $(COMMON)/start.s

$(SW)/mac_test.mem: $(MAC_DEPS)
	@echo "MAKE    mac_test.mem"
	@make -C $(SW) mac_test.mem $(QUIET_FLAG)

BOOT_DEPS    = $(COMMON)/bootrom.s

$(SW)/bootrom.mem:
	@echo "MAKE    bootrom.mem"
	@make -C $(SW) bootrom.mem $(QUIET_FLAG)


run_mac: $(SW)/mac_test.mem $(SW)/bootrom.mem compile_mac run.do.template terminal.so rocket_lib $(TERMINAL)/bin/terminal_emulator
	@sed -e "s-APP_CODE-$(SW)/mac_test.mem-" run.do.template | sed -e "s-BOOT_CODE-$(SW)/bootrom.mem-" > run.do
	@rm run.do.template
	@echo "VSIM    tbench"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

#=== MAC accelerator


MAC_DEPS = $(CAT)/mac.cpp $(CAT)/mac.tcl

$(HW)/mac.v: $(MAC_DEPS)
	@echo "MAKE    accelerator"
	@make -C $(MAC)/cat ../hw/mac.v $(QUIET_FLAG)

IFC_DEPS = $(CAT)/mac.spec

$(HW)/cat_mac.v: $(IFC_DEPS)
	@echo "MAKE    accelerator"
	@make -C $(MAC)/cat ../hw/cat_mac.v $(QUIET_FLAG)

$(markers)/mac: $(HW)/mac.v $(markers)
	@echo "VLOG    mac.v"
	@$(VLOG) $(VLOG_FLAGS) $(HW)/mac.v >> make.out
	@touch ./$(markers)/mac

$(markers)/cat_mac: $(HW)/cat_mac.v $(markers)
	@echo "VLOG    cat_mac.v"
	@$(VLOG) $(VLOG_FLAGS) $(HW)/cat_mac.v >> make.out
	@touch ./$(markers)/cat_mac

clean_mac:
	@echo "Removing created fiels and cruft"
	@make clean $(QUIET_FLAG)
	@make -C $(SW) clean $(QUIET_FLAG)
	@make -C $(MAC)/cat clean $(QUIET_FLAG)
