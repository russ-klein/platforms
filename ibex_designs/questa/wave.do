onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {RISC-V CPU Signals}
add wave -noupdate /tbench/t0/cpu0/clk_i
add wave -noupdate /tbench/t0/cpu0/rst_ni
add wave -noupdate /tbench/t0/cpu0/instr_req_o
add wave -noupdate /tbench/t0/cpu0/instr_gnt_i
add wave -noupdate /tbench/t0/cpu0/instr_rvalid_i
add wave -noupdate /tbench/t0/cpu0/instr_addr_o
add wave -noupdate /tbench/t0/cpu0/instr_rdata_i
add wave -noupdate /tbench/t0/cpu0/data_req_o
add wave -noupdate /tbench/t0/cpu0/data_gnt_i
add wave -noupdate /tbench/t0/cpu0/data_rvalid_i
add wave -noupdate /tbench/t0/cpu0/data_we_o
add wave -noupdate /tbench/t0/cpu0/data_be_o
add wave -noupdate /tbench/t0/cpu0/data_addr_o
add wave -noupdate /tbench/t0/cpu0/data_wdata_o
add wave -noupdate /tbench/t0/cpu0/data_rdata_i
add wave -noupdate /tbench/t0/cpu0/data_err_i
add wave -noupdate -divider {Accelerator Signals}
add wave -noupdate /tbench/t0/a0/READ_ADDR
add wave -noupdate /tbench/t0/a0/DATA_OUT
add wave -noupdate /tbench/t0/a0/DATA_VALID
add wave -noupdate /tbench/t0/a0/OE
add wave -noupdate /tbench/t0/a0/WRITE_ADDR
add wave -noupdate /tbench/t0/a0/DATA_IN
add wave -noupdate /tbench/t0/a0/BE
add wave -noupdate /tbench/t0/a0/WE
add wave -noupdate /tbench/t0/a0/WACK
add wave -noupdate /tbench/t0/a0/read_address
add wave -noupdate /tbench/t0/a0/write_address
add wave -noupdate /tbench/t0/a0/read_data
add wave -noupdate -divider {Terminal Signals}
add wave -noupdate /tbench/t0/u0/READ_ADDRESS
add wave -noupdate /tbench/t0/u0/READ_DATA
add wave -noupdate /tbench/t0/u0/DATA_VALID
add wave -noupdate /tbench/t0/u0/OE
add wave -noupdate /tbench/t0/u0/WRITE_ADDRESS
add wave -noupdate /tbench/t0/u0/WRITE_DATA
add wave -noupdate /tbench/t0/u0/WE
add wave -noupdate /tbench/t0/u0/BE
add wave -noupdate /tbench/t0/u0/WACK
add wave -noupdate -divider {Memory Signals}
add wave -noupdate /tbench/t0/s0/READ_ADDR
add wave -noupdate /tbench/t0/s0/DATA_OUT
add wave -noupdate /tbench/t0/s0/DATA_VALID
add wave -noupdate /tbench/t0/s0/OE
add wave -noupdate /tbench/t0/s0/WRITE_ADDR
add wave -noupdate /tbench/t0/s0/DATA_IN
add wave -noupdate /tbench/t0/s0/BE
add wave -noupdate /tbench/t0/s0/WE
add wave -noupdate /tbench/t0/s0/WACK
add wave -noupdate -divider {Accelerator Signals}
add wave sim:/tbench/t0/a0/cat_accel/*
add wave -noupdate -divider {Arbiter Signals}
add wave -noupdate /tbench/t0/arb0/*
add wave -noupdate -divider {Chip Select Signals}
add wave -noupdate /tbench/t0/arb0/cs0/*

