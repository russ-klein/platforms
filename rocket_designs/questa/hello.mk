
HELLO=        $(DESIGNS)/hello
SW=           $(HELLO)/sw
COMMON=       $(DESIGNS)/common

compile_hello: compile $(markers)/null_periph.sv.mark
	
HELLO_DEPS  = $(SW)/hello.c       \
              $(COMMON)/console.c \
              $(COMMON)/console.h \
              $(COMMON)/start.s
	
$(SW)/hello.mem: $(HELLO_DEPS)
	@echo "MAKE    hello.mem"
	@make -C $(HELLO)/sw hello.mem $(QUIET_FLAG)

BOOT_DEPS   = $(COMMON)/bootrom.s

$(SW)/bootrom.mem: $(BOOT_DEPS)
	@echo "MAKE    bootrom.mem"
	@make -C $(HELLO)/sw bootrom.mem $(QUIET_FLAG)

run_hello: $(SW)/hello.mem $(SW)/bootrom.mem compile_hello terminal.so $(TERMINAL)/bin/terminal_emulator run.do.template rocket_lib
	@sed -e "s-APP_CODE-$(HELLO)/sw/hello.mem-" run.do.template | sed -e "s-BOOT_CODE-$(HELLO)/sw/bootrom.mem-" > run.do
	@rm run.do.template
	@echo "VSIM    tbench"
	@$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal >> make.out

clean_hello:
	@make clean $(QUIET_FLAG)
	@make -C $(HELLO)/sw clean $(QUIET_FLAG)

