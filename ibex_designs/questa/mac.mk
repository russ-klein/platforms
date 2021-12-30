MAC       = $(DESIGNS)/mac

compile_mac: compile $(markers)/cat_mac $(markers)/mac 


$(MAC)/sw/mac_test.mem:
	@make -C $(MAC)/sw $(QUIET_FLAG)


run_mac: $(MAC)/sw/mac_test.mem compile_mac run.do.template $(TERMINAL)/bin/terminal_emulator terminal.so
	@sed -e "s-APP_CODE-$(MAC)/sw/mac_test.mem-" run.do.template > run.do
	@rm run.do.template
	@echo "VSIM    tbench -do run.do -sv_lib terminal"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

#=== MAC accelerator

$(MAC)/hw/mac.v:
	@make -C $(MAC)/cat ../hw/mac.v $(QUIET_FLAG)

$(MAC)/hw/cat_mac.v:
	@make -C $(MAC)/cat ../hw/cat_mac.v $(QUIET_FLAG)

$(markers)/mac: $(markers) $(MAC)/hw/mac.v $(markers)/cat_accel 
	@echo "VLOG    mac.v"
	@$(VLOG) $(VLOG_FLAGS) $(MAC)/hw/mac.v >> make.out
	@touch $(markers)/mac
	@touch $(markers)/cat_accel

$(markers)/cat_mac: $(markers) $(MAC)/hw/cat_mac.v
	@echo "VLOG    cat_mac.v"
	@$(VLOG) $(VLOG_FLAGS) $(MAC)/hw/cat_mac.v >> make.out
	@touch $(markers)/cat_mac

clean_mac:
	@echo "Removing created files and cruft"
	@make clean $(QUIET_FLAG)
	@make -C $(MAC)/sw clean $(QUIET_FLAG)
	@make -C $(MAC)/cat clean $(QUIET_FLAG)

