WAKE_WORD=      $(DESIGNS)/wake_word

compile_wake_word: .markers/null_periph compile

$(WAKE_WORD)/sw/wake_word.mem:
	make -C $(WAKE_WORD)/sw

run_wake_word: $(WAKE_WORD)/sw/wake_word.mem compile_wake_word terminal.so $(TERMINAL)/bin/terminal_emulator run.do.template
	sed -e "s-APP_CODE-$(WAKE_WORD)/sw/wake_word.mem-" run.do.template > run.do
	rm run.do.template
	$(VSIM) $(VSIM_FLAGS) tbench -do run.do -sv_lib terminal

clean_wake_word:
	make clean
	make -C $(WAKE_WORD)/sw clean

