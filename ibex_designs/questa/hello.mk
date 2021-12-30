HELLO    = $(DESIGNS)/hello

compile_hello: compile $(markers)/null_periph.sv.mark 

$(HELLO)/sw/hello.mem:
	@make -C $(HELLO)/sw $(QUIET_FLAG)

run_hello: $(HELLO)/sw/hello.mem compile_hello terminal.so $(TERMINAL)/bin/terminal_emulator run.do.template
	@sed -e "s-APP_CODE-$(HELLO)/sw/hello.mem-" run.do.template > run.do
	@rm run.do.template
	@echo "VSIM    tbench -do run.do -sv_lib terminal"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

clean_hello:
	@echo "Removing created files and cruft"
	@make clean $(QUIET_FLAG)
	@make -C $(HELLO)/sw clean $(QUIET_FLAG)

