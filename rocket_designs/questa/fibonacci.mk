
FIB=	$(DESIGNS)/fibonacci
SW=     $(FIB)/sw
COMMON=	$(DESIGNS)/common

compile_fib: compile $(markers)/null_periph.sv.mark
	
FIB_DEPS  = $(SW)/fib.s
	
$(SW)/fib.mem: $(FIB_DEPS)
	@echo "MAKE    fib.mem"
	@make -C $(SW) fib.mem $(QUIET_FLAG)

BOOT_DEPS  = $(COMMON)/bootrom.s
	
$(SW)/bootrom.mem: $(BOOT_DEPS)
	@echo "MAKE    bootrom.mem"
	@make -C $(SW) bootrom.mem $(QUIET_FLAG)

run_fib: $(SW)/fib.mem $(SW)/bootrom.mem compile_fib terminal.so $(TERMINAL)/bin/terminal_emulator run.do.template rocket_lib
	@sed -e "s-APP_CODE-$(SW)/fib.mem-" run.do.template | sed -e "s-BOOT_CODE-$(SW)/bootrom.mem-" > run.do
	@rm run.do.template
	@echo "VSIM    tbench"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

clean_fib:
	@make clean $(QUIET_FLAG)
	@make -C $(SW) clean $(QUIET_FLAG)

