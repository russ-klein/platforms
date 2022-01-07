onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbench/t0/rocket_subsystem/clock
add wave -noupdate /tbench/t0/rocket_subsystem/reset
add wave -noupdate -divider {Memory Address Write}
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_addr
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_len
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_size
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_burst
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_lock
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_cache
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_prot
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_aw_bits_qos
add wave -noupdate -divider {Memory Write}
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_w_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_w_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_w_bits_data
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_w_bits_strb
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_w_bits_last
add wave -noupdate -divider {Memory Write Response}
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_b_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_b_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_b_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_b_bits_resp
add wave -noupdate -divider {Memory Address Read}
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_addr
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_len
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_size
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_burst
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_lock
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_cache
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_prot
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_ar_bits_qos
add wave -noupdate -divider {Memory Read}
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_r_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_r_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_r_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_r_bits_data
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_r_bits_resp
add wave -noupdate /tbench/t0/rocket_subsystem/mem_axi4_0_r_bits_last
add wave -noupdate -divider {I/O Address Write}
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_addr
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_len
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_size
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_burst
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_lock
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_cache
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_prot
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_aw_bits_qos
add wave -noupdate -divider {I/O Write}
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_w_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_w_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_w_bits_data
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_w_bits_strb
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_w_bits_last
add wave -noupdate -divider {I/O Write Response}
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_b_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_b_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_b_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_b_bits_resp
add wave -noupdate -divider {I/O Read Address}
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_addr
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_len
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_size
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_burst
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_lock
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_cache
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_prot
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_ar_bits_qos
add wave -noupdate -divider {I/O Read}
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_r_ready
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_r_valid
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_r_bits_id
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_r_bits_data
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_r_bits_resp
add wave -noupdate /tbench/t0/rocket_subsystem/mmio_axi4_0_r_bits_last
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1101 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 286
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1733 ns}
