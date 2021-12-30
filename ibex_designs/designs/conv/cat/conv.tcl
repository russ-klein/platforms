//  Catapult Ultra Synthesis 10.3d/815731 (Production Release) Wed Apr 24 14:54:19 PDT 2019
//  
//  Copyright (c) Mentor Graphics Corporation, 1996-2019, All Rights Reserved.
//                        UNPUBLISHED, LICENSED SOFTWARE.
//             CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
//                 PROPERTY OF MENTOR GRAPHICS OR ITS LICENSORS
//  
//  Running on Linux russk@orw-russk-vm 3.10.0-229.14.1.el7.x86_64 x86_64 aol
//  
//  Package information: SIFLIBS v23.3_4.0, HLS_PKGS v23.3_4.0, 
//                       SIF_TOOLKITS v23.3_4.0, SIF_XILINX v23.3_4.0, 
//                       SIF_ALTERA v23.3_4.0, CCS_LIBS v23.3_4.0, 
//                       CDS_PPRO PowerPro-10.2_4, 
//                       CDS_DesigChecker 10.3b.1902031227, 
//                       CDS_OASYS v18.1_3.19, DesignPad v2.78_1.0
//  
solution new -state initial
solution options defaults
solution options set /Input/CompilerFlags {-DHOST -DBATCH}
solution options set /Output/GenerateCycleNetlist false
solution options set /Flows/SCVerify/USE_CCS_BLOCK true
solution file add ./conv.cpp -type C++
solution file add ./sw_conv.h -type CHEADER -exclude true
solution file add ./sw_conv.c -type C++ -exclude true
solution file add ./conv.h -type CHEADER -exclude true
solution file add ./hw_conv_host.h -type CHEADER -exclude true
solution file add ./hw_conv.c -type C++ -exclude true
solution file add ./hw_conv.h -type CHEADER -exclude true
solution file add ./conv_test.h -type CHEADER -exclude true
solution file add ./conv_test.c -type C++ -exclude true
directive set -PIPELINE_RAMP_UP true
directive set -COMPGRADE fast
directive set -CLUSTER_TYPE combinational
directive set -CLUSTER_FAST_MODE false
directive set -CLUSTER_RTL_SYN false
directive set -CLUSTER_OPT_CONSTANT_INPUTS true
directive set -CLUSTER_ADDTREE_IN_COUNT_THRESHOLD 0
directive set -ROM_THRESHOLD 64
directive set -PROTOTYPE_ROM true
directive set -CHARACTERIZE_ROM false
directive set -OPT_CONST_MULTS use_library
directive set -CLOCK_OVERHEAD 20.000000
directive set -RESET_CLEARS_ALL_REGS true
directive set -DATA_SYNC none
directive set -TRANSACTION_SYNC ready
directive set -BLOCK_SYNC none
directive set -START_FLAG {}
directive set -READY_FLAG {}
directive set -DONE_FLAG {}
directive set -TRANSACTION_DONE_SIGNAL true
directive set -STALL_FLAG false
directive set -IDLE_SIGNAL {}
directive set -REGISTER_IDLE_SIGNAL false
directive set -ARRAY_SIZE 1024
directive set -CHAN_IO_PROTOCOL standard
directive set -IO_MODE super
directive set -UNROLL no
directive set -REALLOC true
directive set -MUXPATH true
directive set -TIMING_CHECKS true
directive set -ASSIGN_OVERHEAD 0
directive set -REGISTER_SHARING_LIMIT 0
directive set -REGISTER_SHARING_MAX_WIDTH_DIFFERENCE 8
directive set -SAFE_FSM false
directive set -NO_X_ASSIGNMENTS true
directive set -REG_MAX_FANOUT 0
directive set -FSM_BINARY_ENCODING_THRESHOLD 64
directive set -FSM_ENCODING none
directive set -LOGIC_OPT false
directive set -MEM_MAP_THRESHOLD 32
directive set -REGISTER_THRESHOLD 256
directive set -MERGEABLE true
directive set -SPECULATE true
directive set -DESIGN_GOAL area
go new
directive set -DESIGN_HIERARCHY conv
go analyze
solution library add mgc_sample-065nm-dw_beh_dc -- -rtlsyntool DesignCompiler -vendor Sample -technology 065nm -Designware Yes
solution library add ccs_sample_mem
go libraries
directive set -CLOCKS {clk {-CLOCK_PERIOD 3.33 -CLOCK_EDGE rising -CLOCK_UNCERTAINTY 0.0 -CLOCK_HIGH_TIME 1.665 -RESET_SYNC_NAME rst -RESET_ASYNC_NAME arst_n -RESET_KIND sync -RESET_SYNC_ACTIVE high -RESET_ASYNC_ACTIVE low -ENABLE_ACTIVE high}}
go assembly
directive set /conv/core/if:ring_buffer:rsc -BLOCK_SIZE 512
directive set /conv/core/main_rows -PIPELINE_INIT_INTERVAL 1
directive set /conv/core/inner_summation -UNROLL yes
directive set /conv/core/outer_summation -UNROLL yes
directive set /conv/core/inner_conv -UNROLL yes
directive set /conv/core/outer_conv -UNROLL yes
directive set /conv/core/feature_map_in.load_more_data:for -UNROLL yes
directive set /conv/core/image_shift -UNROLL yes
directive set /conv/core/image_load -UNROLL yes
directive set /conv/core -DESIGN_GOAL latency
directive set /conv/image_word_array:rsc -MAP_TO_MODULE {ccs_ioport.ccs_in_pipe fifo_sz=128}
directive set /conv/core/filter_bs_row -UNROLL yes
directive set /conv/core/filter_bs_col -UNROLL yes
go architect
directive set /conv/core/image_load:if:write_mem(if:ring_buffer:rsc(0)(0).@) -IGNORE_DEPENDENCY_FROM image_load:if:read_mem(if:ring_buffer:rsc(0)(0).@)
directive set /conv/core/image_load:if:write_mem(if:ring_buffer:rsc(1)(0).@)#1 -IGNORE_DEPENDENCY_FROM image_load:if:read_mem(if:ring_buffer:rsc(1)(0).@)#1
directive set /conv/core/image_load:if:read_mem(if:ring_buffer:rsc(1)(0).@)#1 -IGNORE_DEPENDENCY_FROM image_load:if:write_mem(if:ring_buffer:rsc(1)(0).@)#1
directive set /conv/core/main_cols:if:write_mem(output_image:rsc.@) -IGNORE_DEPENDENCY_FROM main_cols:if:read_mem(output_image:rsc.@)
directive set /conv/core/main_cols:if:read_mem(output_image:rsc.@) -IGNORE_DEPENDENCY_FROM main_cols:if:write_mem(output_image:rsc.@)
go allocate
go extract
