
FIB      = $(DESIGNS)/fibonacci

compile_fib: compile $(markers)/null_periph.sv.mark
	
	
$(FIB)/sw/fib.mem:
	@make -C $(FIB)/sw $(QUIET_FLAG)

run_fib: $(FIB)/sw/fib.mem compile_fib terminal.so $(TERMINAL)/bin/terminal_emulator run.do.template
	@sed -e "s-APP_CODE-$(FIB)/sw/fib.mem-" run.do.template > run.do
	@rm run.do.template
	@echo "VSIM    tbench -do run.do -sv_lib terminal"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

clean_fib:
	@echo "Removing created files and cruft"
	@make clean $(QUIET_FLAG)
	@make -C $(FIB)/sw clean $(QUIET_FLAG)
