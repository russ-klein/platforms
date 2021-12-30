CONV      =       $(DESIGNS)/conv

compile_conv: $(markers)/cat_conv $(markers)/conv compile


$(CONV)/sw/conv_test.mem:
	@make -C $(CONV)/sw $(QUIET_FLAG)

run_conv: $(CONV)/sw/conv_test.mem compile_conv run.do.template $(TERMINAL)/bin/terminal_emulator terminal.so
	@sed -e "s-APP_CODE-$(CONV)/sw/conv_test.mem-" run.do.template > run.do
	@rm run.do.template
	@echo "VSIM    tbench -do run.do -sv_lib terminal"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

#=== Convolution accelerator

$(CONV)/hw/conv.v:
	@make -C $(CONV)/cat ../hw/conv.v $(QUIET_FLAG)

$(CONV)/hw/cat_conv.v:
	@make -C $(CONV)/cat ../hw/cat_conv.v $(QUIET_FLAG)

$(markers)/conv: $(CONV)/hw/conv.v $(CONV)/hw/cat_conv.v $(markers)/cat_accel $(markers)
	@echo "VLOG    conv.v"
	@$(VLOG) $(VLOG_FLAGS) $(CONV)/hw/conv.v >> make.out
	@touch $(markers)/conv
	@touch $(markers)/cat_accel

$(markers)/cat_conv: $(CONV)/hw/cat_conv.v $(markers)
	@echo "VLOG    cat_conv.v"
	@$(VLOG) $(VLOG_FLAGS) $(CONV)/hw/cat_conv.v >> make.out
	@touch $(markers)/cat_conv

clean_conv:
	@echo "Removing created files and cruft"
	@make clean $(QUIET_FLAG)
	@make -C $(CONV)/sw clean $(QUIET_FLAG)
	@make -C $(CONV)/cat clean $(QUIET_FLAG)

