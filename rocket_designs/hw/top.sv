
`include "axi_bus_defines.svh"

module top( 
  input clock, 
  input reset  
);

`define mmasters 1
`define mslaves 1
`define pmasters 1
`define pslaves 3

    wire [`id_bits-1:0]         M_AW_ID[`mmasters-1:0];
    wire [`addr_bits-1:0]       M_AW_ADDR[`mmasters-1:0];
    wire [`len_bits-1:0]        M_AW_LEN[`mmasters-1:0];
    wire [`size_bits-1:0]       M_AW_SIZE[`mmasters-1:0];
    wire [`burst_bits-1:0]      M_AW_BURST[`mmasters-1:0];
    wire [`lock_bits-1:0]       M_AW_LOCK[`mmasters-1:0];
    wire [`cache_bits-1:0]      M_AW_CACHE[`mmasters-1:0];
    wire [`prot_bits-1:0]       M_AW_PROT[`mmasters-1:0];
    wire [`qos_bits-1:0]        M_AW_QOS[`mmasters-1:0];
    wire                        M_AW_VALID[`mmasters-1:0];
    wire                        M_AW_READY[`mmasters-1:0];

    wire [`id_bits-1:0]         M_W_ID[`mmasters-1:0];
    wire [`data_bits-1:0]       M_W_DATA[`mmasters-1:0];
    wire [`strb_bits-1:0]       M_W_STRB[`mmasters-1:0];
    wire                        M_W_LAST[`mmasters-1:0];
    wire                        M_W_VALID[`mmasters-1:0];
    wire                        M_W_READY[`mmasters-1:0];

    wire [`id_bits-1:0]         M_B_ID[`mmasters-1:0];
    wire [`resp_bits-1:0]       M_B_RESP[`mmasters-1:0];
    wire                        M_B_VALID[`mmasters-1:0];
    wire                        M_B_READY[`mmasters-1:0];

    wire [`id_bits-1:0]         M_AR_ID[`mmasters-1:0];
    wire [`addr_bits-1:0]       M_AR_ADDR[`mmasters-1:0];
    wire [`len_bits-1:0]        M_AR_LEN[`mmasters-1:0];
    wire [`size_bits-1:0]       M_AR_SIZE[`mmasters-1:0];
    wire [`burst_bits-1:0]      M_AR_BURST[`mmasters-1:0];
    wire [`lock_bits-1:0]       M_AR_LOCK[`mmasters-1:0];
    wire [`cache_bits-1:0]      M_AR_CACHE[`mmasters-1:0];
    wire [`prot_bits-1:0]       M_AR_PROT[`mmasters-1:0];
    wire [`qos_bits-1:0]        M_AR_QOS[`mmasters-1:0];
    wire                        M_AR_VALID[`mmasters-1:0];
    wire                        M_AR_READY[`mmasters-1:0];

    wire [`id_bits-1:0]         M_R_ID[`mmasters-1:0];
    wire [`data_bits-1:0]       M_R_DATA[`mmasters-1:0];
    wire [`resp_bits-1:0]       M_R_RESP[`mmasters-1:0];
    wire                        M_R_LAST[`mmasters-1:0];
    wire                        M_R_VALID[`mmasters-1:0];
    wire                        M_R_READY[`mmasters-1:0];

    wire [`pmasters-1:0]        MS_AW_MASTER[`mslaves-1:0];
    wire [`id_bits-1:0]         MS_AW_ID[`mslaves-1:0];
    wire [`addr_bits-1:0]       MS_AW_ADDR[`mslaves-1:0];
    wire [`len_bits-1:0]        MS_AW_LEN[`mslaves-1:0];
    wire [`size_bits-1:0]       MS_AW_SIZE[`mslaves-1:0];
    wire [`burst_bits-1:0]      MS_AW_BURST[`mslaves-1:0];
    wire [`lock_bits-1:0]       MS_AW_LOCK[`mslaves-1:0];
    wire [`cache_bits-1:0]      MS_AW_CACHE[`mslaves-1:0];
    wire [`prot_bits-1:0]       MS_AW_PROT[`mslaves-1:0];
    wire [`qos_bits-1:0]        MS_AW_QOS[`mslaves-1:0];
    wire                        MS_AW_VALID[`mslaves-1:0];
    wire                        MS_AW_READY[`mslaves-1:0];

    wire [`pmasters-1:0]        MS_W_MASTER[`mslaves-1:0];
    wire [`id_bits-1:0]         MS_W_ID[`mslaves-1:0];
    wire [`data_bits-1:0]       MS_W_DATA[`mslaves-1:0];
    wire [`strb_bits-1:0]       MS_W_STRB[`mslaves-1:0];
    wire                        MS_W_LAST[`mslaves-1:0];
    wire                        MS_W_VALID[`mslaves-1:0];
    wire                        MS_W_READY[`mslaves-1:0];

    wire [`pmasters-1:0]        MS_B_MASTER[`mslaves-1:0];
    wire [`id_bits-1:0]         MS_B_ID[`mslaves-1:0];
    wire [`resp_bits-1:0]       MS_B_RESP[`mslaves-1:0];
    wire                        MS_B_VALID[`mslaves-1:0];
    wire                        MS_B_READY[`mslaves-1:0];

    wire [`pmasters-1:0]        MS_AR_MASTER[`mslaves-1:0];
    wire [`id_bits-1:0]         MS_AR_ID[`mslaves-1:0];
    wire [`addr_bits-1:0]       MS_AR_ADDR[`mslaves-1:0];
    wire [`len_bits-1:0]        MS_AR_LEN[`mslaves-1:0];
    wire [`size_bits-1:0]       MS_AR_SIZE[`mslaves-1:0];
    wire [`burst_bits-1:0]      MS_AR_BURST[`mslaves-1:0];
    wire [`lock_bits-1:0]       MS_AR_LOCK[`mslaves-1:0];
    wire [`cache_bits-1:0]      MS_AR_CACHE[`mslaves-1:0];
    wire [`prot_bits-1:0]       MS_AR_PROT[`mslaves-1:0];
    wire [`qos_bits-1:0]        MS_AR_QOS[`mslaves-1:0];
    wire                        MS_AR_VALID[`mslaves-1:0];
    wire                        MS_AR_READY[`mslaves-1:0];

    wire [`pmasters-1:0]        MS_R_MASTER[`mslaves-1:0];
    wire [`id_bits-1:0]         MS_R_ID[`mslaves-1:0];
    wire [`data_bits-1:0]       MS_R_DATA[`mslaves-1:0];
    wire [`resp_bits-1:0]       MS_R_RESP[`mslaves-1:0];
    wire                        MS_R_LAST[`mslaves-1:0];
    wire                        MS_R_VALID[`mslaves-1:0];
    wire                        MS_R_READY[`mslaves-1:0];


    wire [`id_bits-1:0]         P_AW_ID[`pmasters-1:0];
    wire [`addr_bits-1:0]       P_AW_ADDR[`pmasters-1:0];
    wire [`len_bits-1:0]        P_AW_LEN[`pmasters-1:0];
    wire [`size_bits-1:0]       P_AW_SIZE[`pmasters-1:0];
    wire [`burst_bits-1:0]      P_AW_BURST[`pmasters-1:0];
    wire [`lock_bits-1:0]       P_AW_LOCK[`pmasters-1:0];
    wire [`cache_bits-1:0]      P_AW_CACHE[`pmasters-1:0];
    wire [`prot_bits-1:0]       P_AW_PROT[`pmasters-1:0];
    wire [`qos_bits-1:0]        P_AW_QOS[`pmasters-1:0];
    wire                        P_AW_VALID[`pmasters-1:0];
    wire                        P_AW_READY[`pmasters-1:0];

    wire [`id_bits-1:0]         P_W_ID[`pmasters-1:0];
    wire [`data_bits-1:0]       P_W_DATA[`pmasters-1:0];
    wire [`strb_bits-1:0]       P_W_STRB[`pmasters-1:0];
    wire                        P_W_LAST[`pmasters-1:0];
    wire                        P_W_VALID[`pmasters-1:0];
    wire                        P_W_READY[`pmasters-1:0];

    wire [`id_bits-1:0]         P_B_ID[`pmasters-1:0];
    wire [`resp_bits-1:0]       P_B_RESP[`pmasters-1:0];
    wire                        P_B_VALID[`pmasters-1:0];
    wire                        P_B_READY[`pmasters-1:0];

    wire [`id_bits-1:0]         P_AR_ID[`pmasters-1:0];
    wire [`addr_bits-1:0]       P_AR_ADDR[`pmasters-1:0];
    wire [`len_bits-1:0]        P_AR_LEN[`pmasters-1:0];
    wire [`size_bits-1:0]       P_AR_SIZE[`pmasters-1:0];
    wire [`burst_bits-1:0]      P_AR_BURST[`pmasters-1:0];
    wire [`lock_bits-1:0]       P_AR_LOCK[`pmasters-1:0];
    wire [`cache_bits-1:0]      P_AR_CACHE[`pmasters-1:0];
    wire [`prot_bits-1:0]       P_AR_PROT[`pmasters-1:0];
    wire [`qos_bits-1:0]        P_AR_QOS[`pmasters-1:0];
    wire                        P_AR_VALID[`pmasters-1:0];
    wire                        P_AR_READY[`pmasters-1:0];

    wire [`id_bits-1:0]         P_R_ID[`pmasters-1:0];
    wire [`data_bits-1:0]       P_R_DATA[`pmasters-1:0];
    wire [`resp_bits-1:0]       P_R_RESP[`pmasters-1:0];
    wire                        P_R_LAST[`pmasters-1:0];
    wire                        P_R_VALID[`pmasters-1:0];
    wire                        P_R_READY[`pmasters-1:0];

    wire [`pmasters-1:0]        PS_AW_MASTER[`pslaves-1:0];
    wire [`id_bits-1:0]         PS_AW_ID[`pslaves-1:0];
    wire [`addr_bits-1:0]       PS_AW_ADDR[`pslaves-1:0];
    wire [`len_bits-1:0]        PS_AW_LEN[`pslaves-1:0];
    wire [`size_bits-1:0]       PS_AW_SIZE[`pslaves-1:0];
    wire [`burst_bits-1:0]      PS_AW_BURST[`pslaves-1:0];
    wire [`lock_bits-1:0]       PS_AW_LOCK[`pslaves-1:0];
    wire [`cache_bits-1:0]      PS_AW_CACHE[`pslaves-1:0];
    wire [`prot_bits-1:0]       PS_AW_PROT[`pslaves-1:0];
    wire [`qos_bits-1:0]        PS_AW_QOS[`pslaves-1:0];
    wire                        PS_AW_VALID[`pslaves-1:0];
    wire                        PS_AW_READY[`pslaves-1:0];

    wire [`pmasters-1:0]        PS_W_MASTER[`pslaves-1:0];
    wire [`id_bits-1:0]         PS_W_ID[`pslaves-1:0];
    wire [`data_bits-1:0]       PS_W_DATA[`pslaves-1:0];
    wire [`strb_bits-1:0]       PS_W_STRB[`pslaves-1:0];
    wire                        PS_W_LAST[`pslaves-1:0];
    wire                        PS_W_VALID[`pslaves-1:0];
    wire                        PS_W_READY[`pslaves-1:0];

    wire [`pmasters-1:0]        PS_B_MASTER[`pslaves-1:0];
    wire [`id_bits-1:0]         PS_B_ID[`pslaves-1:0];
    wire [`resp_bits-1:0]       PS_B_RESP[`pslaves-1:0];
    wire                        PS_B_VALID[`pslaves-1:0];
    wire                        PS_B_READY[`pslaves-1:0];

    wire [`pmasters-1:0]        PS_AR_MASTER[`pslaves-1:0];
    wire [`id_bits-1:0]         PS_AR_ID[`pslaves-1:0];
    wire [`addr_bits-1:0]       PS_AR_ADDR[`pslaves-1:0];
    wire [`len_bits-1:0]        PS_AR_LEN[`pslaves-1:0];
    wire [`size_bits-1:0]       PS_AR_SIZE[`pslaves-1:0];
    wire [`burst_bits-1:0]      PS_AR_BURST[`pslaves-1:0];
    wire [`lock_bits-1:0]       PS_AR_LOCK[`pslaves-1:0];
    wire [`cache_bits-1:0]      PS_AR_CACHE[`pslaves-1:0];
    wire [`prot_bits-1:0]       PS_AR_PROT[`pslaves-1:0];
    wire [`qos_bits-1:0]        PS_AR_QOS[`pslaves-1:0];
    wire                        PS_AR_VALID[`pslaves-1:0];
    wire                        PS_AR_READY[`pslaves-1:0];

    wire [`pmasters-1:0]        PS_R_MASTER[`pslaves-1:0];
    wire [`id_bits-1:0]         PS_R_ID[`pslaves-1:0];
    wire [`data_bits-1:0]       PS_R_DATA[`pslaves-1:0];
    wire [`resp_bits-1:0]       PS_R_RESP[`pslaves-1:0];
    wire                        PS_R_LAST[`pslaves-1:0];
    wire                        PS_R_VALID[`pslaves-1:0];
    wire                        PS_R_READY[`pslaves-1:0];

    wire [31:0]                 SRAM_READ_ADDR;
    wire [63:0]                 SRAM_READ_DATA;
    wire                        SRAM_OE;
    wire [31:0]                 SRAM_WRITE_ADDR;
    wire [63:0]                 SRAM_WRITE_DATA;
    wire [7:0]                  SRAM_WRITE_BE;
    wire                        SRAM_WRITE_STROBE;

    wire [31:0]                 UART_READ_ADDR;
    wire [63:0]                 UART_READ_DATA;
    wire                        UART_OE;
    wire [31:0]                 UART_WRITE_ADDR;
    wire [63:0]                 UART_WRITE_DATA;
    wire [7:0]                  UART_WRITE_BE;
    wire                        UART_WRITE_STROBE;

    wire [31:0]                 CAT_READ_ADDR;
    wire [63:0]                 CAT_READ_DATA;
    wire                        CAT_OE;
    wire [31:0]                 CAT_WRITE_ADDR;
    wire [63:0]                 CAT_WRITE_DATA;
    wire [7:0]                  CAT_WRITE_BE;
    wire                        CAT_WRITE_STROBE;

    wire [31:0]                 TIMER_READ_ADDR;
    wire [63:0]                 TIMER_READ_DATA;
    wire                        TIMER_OE;
    wire [31:0]                 TIMER_WRITE_ADDR;
    wire [63:0]                 TIMER_WRITE_DATA;
    wire [7:0]                  TIMER_WRITE_BE;
    wire                        TIMER_WRITE_STROBE;

    wire                        CTS;
    wire                        DSR;
    wire                        DCD;
    wire                        RI;
    wire                        RTS;
    wire                        DTR;
    wire                        OUT;
    wire                        RXD;
    wire                        TXD;

    wire [7:0]                  data_in;
    wire                        dis;
    wire [7:0]                  data_out;
    wire                        dos;


    wire          debug_clockeddmi_dmi_req_ready; 
    wire          debug_clockeddmi_dmi_req_valid = 1'b0; 
    wire   [6:0]  debug_clockeddmi_dmi_req_bits_addr = 7'b0000000; 
    wire   [31:0] debug_clockeddmi_dmi_req_bits_data = 32'h00000000; 
    wire   [1:0]  debug_clockeddmi_dmi_req_bits_op = 2'b00;  
    wire          debug_clockeddmi_dmi_resp_ready = 1'b0; 
    wire          debug_clockeddmi_dmi_resp_valid; 
    wire   [31:0] debug_clockeddmi_dmi_resp_bits_data; 
    wire   [1:0]  debug_clockeddmi_dmi_resp_bits_resp; 
    wire          debug_clockeddmi_dmiClock = clock; 
    wire          debug_clockeddmi_dmiReset = reset; 
    wire          debug_ndreset; 
    wire          debug_dmactive; 

    wire   [1:0]  interrupts = 2'b00; 


    wire          mem_axi4_0_aw_ready = 1'b0; 
    wire          mem_axi4_0_aw_valid; 
    wire   [3:0]  mem_axi4_0_aw_bits_id; 
    wire   [31:0] mem_axi4_0_aw_bits_addr; 
    wire   [7:0]  mem_axi4_0_aw_bits_len; 
    wire   [2:0]  mem_axi4_0_aw_bits_size; 
    wire   [1:0]  mem_axi4_0_aw_bits_burst; 
    wire          mem_axi4_0_aw_bits_lock; 
    wire   [3:0]  mem_axi4_0_aw_bits_cache; 
    wire   [2:0]  mem_axi4_0_aw_bits_prot; 
    wire   [3:0]  mem_axi4_0_aw_bits_qos; 

    wire          mem_axi4_0_w_ready = 1'b0; 
    wire          mem_axi4_0_w_valid; 
    wire   [63:0] mem_axi4_0_w_bits_data; 
    wire   [7:0]  mem_axi4_0_w_bits_strb; 
    wire          mem_axi4_0_w_bits_last; 

    wire          mem_axi4_0_b_ready; 
    wire          mem_axi4_0_b_valid = 1'b0; 
    wire   [3:0]  mem_axi4_0_b_bits_id = 4'h0; 
    wire   [1:0]  mem_axi4_0_b_bits_resp = 4'b00; 

    wire          mem_axi4_0_ar_ready =1'b0; 
    wire          mem_axi4_0_ar_valid; 
    wire   [3:0]  mem_axi4_0_ar_bits_id; 
    wire   [31:0] mem_axi4_0_ar_bits_addr; 
    wire   [7:0]  mem_axi4_0_ar_bits_len; 
    wire   [2:0]  mem_axi4_0_ar_bits_size; 
    wire   [1:0]  mem_axi4_0_ar_bits_burst; 
    wire          mem_axi4_0_ar_bits_lock; 
    wire   [3:0]  mem_axi4_0_ar_bits_cache; 
    wire   [2:0]  mem_axi4_0_ar_bits_prot; 
    wire   [3:0]  mem_axi4_0_ar_bits_qos; 

    wire          mem_axi4_0_r_ready; 
    wire          mem_axi4_0_r_valid = 1'b0; 
    wire   [3:0]  mem_axi4_0_r_bits_id = 4'h0; 
    wire   [63:0] mem_axi4_0_r_bits_data = 64'h0000000000000000; 
    wire   [1:0]  mem_axi4_0_r_bits_resp = 2'b00; 
    wire          mem_axi4_0_r_bits_last = 1'b0;  

    wire          mmio_axi4_0_aw_ready = 1'b0; 
    wire          mmio_axi4_0_aw_valid; 
    wire   [3:0]  mmio_axi4_0_aw_bits_id; 
    wire   [30:0] mmio_axi4_0_aw_bits_addr; 
    wire   [7:0]  mmio_axi4_0_aw_bits_len; 
    wire   [2:0]  mmio_axi4_0_aw_bits_size; 
    wire   [1:0]  mmio_axi4_0_aw_bits_burst; 
    wire          mmio_axi4_0_aw_bits_lock; 
    wire   [3:0]  mmio_axi4_0_aw_bits_cache; 
    wire   [2:0]  mmio_axi4_0_aw_bits_prot; 
    wire   [3:0]  mmio_axi4_0_aw_bits_qos; 

    wire          mmio_axi4_0_w_ready = 1'b0; 
    wire          mmio_axi4_0_w_valid; 
    wire   [63:0] mmio_axi4_0_w_bits_data; 
    wire   [7:0]  mmio_axi4_0_w_bits_strb; 
    wire          mmio_axi4_0_w_bits_last; 

    wire          mmio_axi4_0_b_ready; 
    wire          mmio_axi4_0_b_valid = 1'b0; 
    wire   [3:0]  mmio_axi4_0_b_bits_id = 4'h0; 
    wire   [1:0]  mmio_axi4_0_b_bits_resp = 2'b00; 

    wire          mmio_axi4_0_ar_ready = 1'b0; 
    wire          mmio_axi4_0_ar_valid; 
    wire   [3:0]  mmio_axi4_0_ar_bits_id; 
    wire   [30:0] mmio_axi4_0_ar_bits_addr; 
    wire   [7:0]  mmio_axi4_0_ar_bits_len; 
    wire   [2:0]  mmio_axi4_0_ar_bits_size; 
    wire   [1:0]  mmio_axi4_0_ar_bits_burst; 
    wire          mmio_axi4_0_ar_bits_lock; 
    wire   [3:0]  mmio_axi4_0_ar_bits_cache; 
    wire   [2:0]  mmio_axi4_0_ar_bits_prot; 
    wire   [3:0]  mmio_axi4_0_ar_bits_qos; 

    wire          mmio_axi4_0_r_ready; 
    wire          mmio_axi4_0_r_valid = 1'b0; 
    wire   [3:0]  mmio_axi4_0_r_bits_id = 4'h0; 
    wire   [63:0] mmio_axi4_0_r_bits_data = 64'h0000000000000000; 
    wire   [1:0]  mmio_axi4_0_r_bits_resp = 2'b0; 
    wire          mmio_axi4_0_r_bits_last = 1'b0; 


    wire          l2_frontend_bus_axi4_0_aw_ready; 
    wire          l2_frontend_bus_axi4_0_aw_valid = 1'b0; 
    wire   [7:0]  l2_frontend_bus_axi4_0_aw_bits_id = 8'h00; 
    wire   [31:0] l2_frontend_bus_axi4_0_aw_bits_addr = 32'h00000000; 
    wire   [7:0]  l2_frontend_bus_axi4_0_aw_bits_len = 8'h00;  
    wire   [2:0]  l2_frontend_bus_axi4_0_aw_bits_size = 3'b000; 
    wire   [1:0]  l2_frontend_bus_axi4_0_aw_bits_burst = 2'b00; 
    wire          l2_frontend_bus_axi4_0_aw_bits_lock = 1'b0; 
    wire   [3:0]  l2_frontend_bus_axi4_0_aw_bits_cache = 4'h0; 
    wire   [2:0]  l2_frontend_bus_axi4_0_aw_bits_prot = 3'b000; 
    wire   [3:0]  l2_frontend_bus_axi4_0_aw_bits_qos = 4'h0; 

    wire          l2_frontend_bus_axi4_0_w_ready; 
    wire          l2_frontend_bus_axi4_0_w_valid = 1'b0; 
    wire   [63:0] l2_frontend_bus_axi4_0_w_bits_data = 64'h0000000000000000; 
    wire   [7:0]  l2_frontend_bus_axi4_0_w_bits_strb = 8'h00; 
    wire          l2_frontend_bus_axi4_0_w_bits_last = 1'b0; 

    wire          l2_frontend_bus_axi4_0_b_ready = 1'b0; 
    wire          l2_frontend_bus_axi4_0_b_valid; 
    wire   [7:0]  l2_frontend_bus_axi4_0_b_bits_id; 
    wire   [1:0]  l2_frontend_bus_axi4_0_b_bits_resp; 

    wire          l2_frontend_bus_axi4_0_ar_ready; 
    wire          l2_frontend_bus_axi4_0_ar_valid = 1'b0; 
    wire   [7:0]  l2_frontend_bus_axi4_0_ar_bits_id = 8'h00; 
    wire   [31:0] l2_frontend_bus_axi4_0_ar_bits_addr = 32'h00000000; 
    wire   [7:0]  l2_frontend_bus_axi4_0_ar_bits_len = 8'h00; 
    wire   [2:0]  l2_frontend_bus_axi4_0_ar_bits_size = 3'b00; 
    wire   [1:0]  l2_frontend_bus_axi4_0_ar_bits_burst = 2'b00; 
    wire          l2_frontend_bus_axi4_0_ar_bits_lock = 1'b0; 
    wire   [3:0]  l2_frontend_bus_axi4_0_ar_bits_cache = 4'h0; 
    wire   [2:0]  l2_frontend_bus_axi4_0_ar_bits_prot = 3'b000; 
    wire   [3:0]  l2_frontend_bus_axi4_0_ar_bits_qos = 4'h0; 

    wire          l2_frontend_bus_axi4_0_r_ready = 1'b0; 
    wire          l2_frontend_bus_axi4_0_r_valid; 
    wire   [7:0]  l2_frontend_bus_axi4_0_r_bits_id; 
    wire   [63:0] l2_frontend_bus_axi4_0_r_bits_data; 
    wire   [1:0]  l2_frontend_bus_axi4_0_r_bits_resp; 
    wire          l2_frontend_bus_axi4_0_r_bits_last;
  
  axi_matrix #(`mmasters, `mslaves, 1, 1) mem_complex (

        .ACLK        (clock),
        .ARESETn     (!reset),

        .AWID        (M_AW_ID),
        .AWADDR      (M_AW_ADDR),
        .AWLEN       (M_AW_LEN),
        .AWSIZE      (M_AW_SIZE),
        .AWBURST     (M_AW_BURST),
        .AWLOCK      (M_AW_LOCK),
        .AWCACHE     (M_AW_CACHE),
        .AWPROT      (M_AW_PROT),
        .AWQOS       (M_AW_QOS),
        .AWVALID     (M_AW_VALID),
        .AWREADY     (M_AW_READY),

        .WDATA       (M_W_DATA),
        .WSTRB       (M_W_STRB),
        .WLAST       (M_W_LAST),
        .WVALID      (M_W_VALID),
        .WREADY      (M_W_READY),

        .BID         (M_B_ID),
        .BRESP       (M_B_RESP),
        .BVALID      (M_B_VALID),
        .BREADY      (M_B_READY),

        .ARID        (M_AR_ID),
        .ARADDR      (M_AR_ADDR),
        .ARLEN       (M_AR_LEN),
        .ARSIZE      (M_AR_SIZE),
        .ARBURST     (M_AR_BURST),
        .ARLOCK      (M_AR_LOCK),
        .ARCACHE     (M_AR_CACHE),
        .ARPROT      (M_AR_PROT),
        .ARQOS       (M_AR_QOS),
        .ARVALID     (M_AR_VALID),
        .ARREADY     (M_AR_READY),

        .RID         (M_R_ID),
        .RDATA       (M_R_DATA),
        .RRESP       (M_R_RESP),
        .RLAST       (M_R_LAST),
        .RVALID      (M_R_VALID),
        .RREADY      (M_R_READY),

        .S_AWMASTER  (MS_AW_MASTER),
        .S_AWID      (MS_AW_ID),
        .S_AWADDR    (MS_AW_ADDR),
        .S_AWLEN     (MS_AW_LEN),
        .S_AWSIZE    (MS_AW_SIZE),
        .S_AWBURST   (MS_AW_BURST),
        .S_AWLOCK    (MS_AW_LOCK),
        .S_AWCACHE   (MS_AW_CACHE),
        .S_AWPROT    (MS_AW_PROT),
        .S_AWQOS     (MS_AW_QOS),
        .S_AWVALID   (MS_AW_VALID),
        .S_AWREADY   (MS_AW_READY),

        .S_WMASTER   (MS_W_MASTER),
        .S_WID       (MS_W_ID),
        .S_WDATA     (MS_W_DATA),
        .S_WSTRB     (MS_W_STRB),
        .S_WLAST     (MS_W_LAST),
        .S_WVALID    (MS_W_VALID),
        .S_WREADY    (MS_W_READY),

        .S_BMASTER   (MS_B_MASTER),
        .S_BID       (MS_B_ID),
        .S_BRESP     (MS_B_RESP),
        .S_BVALID    (MS_B_VALID),
        .S_BREADY    (MS_B_READY),

        .S_ARMASTER  (MS_AR_MASTER),
        .S_ARID      (MS_AR_ID),
        .S_ARADDR    (MS_AR_ADDR),
        .S_ARLEN     (MS_AR_LEN),
        .S_ARSIZE    (MS_AR_SIZE),
        .S_ARBURST   (MS_AR_BURST),
        .S_ARLOCK    (MS_AR_LOCK),
        .S_ARCACHE   (MS_AR_CACHE),
        .S_ARPROT    (MS_AR_PROT),
        .S_ARQOS     (MS_AR_QOS),
        .S_ARVALID   (MS_AR_VALID),
        .S_ARREADY   (MS_AR_READY),

        .S_RMASTER   (MS_R_MASTER),
        .S_RID       (MS_R_ID),
        .S_RDATA     (MS_R_DATA),
        .S_RRESP     (MS_R_RESP),
        .S_RLAST     (MS_R_LAST),
        .S_RVALID    (MS_R_VALID),
        .S_RREADY    (MS_R_READY)

    );

    axi_slave_interface
        #(
        .masters   (`pmasters),
        .width     (24),
        .id_bits   (`id_bits),
        .p_size    (3),
        .b_size    (3))

        mem_if (

        .ACLK      (clock),
        .ARESETn   (!reset),

        .AWMASTER  (MS_AW_MASTER[0]),
        .AWID      (MS_AW_ID[0]),
        .AWADDR    (MS_AW_ADDR[0][23:0]),
        .AWLEN     (MS_AW_LEN[0]),
        .AWSIZE    (MS_AW_SIZE[0]),
        .AWBURST   (MS_AW_BURST[0]),
        .AWLOCK    (MS_AW_LOCK[0]),
        .AWCACHE   (MS_AW_CACHE[0]),
        .AWPROT    (MS_AW_PROT[0]),
        .AWVALID   (MS_AW_VALID[0]),
        .AWREADY   (MS_AW_READY[0]),

        .WMASTER   (MS_W_MASTER[0]),
        .WID       (MS_W_ID[0]),
        .WDATA     (MS_W_DATA[0]),
        .WSTRB     (MS_W_STRB[0]),
        .WLAST     (MS_W_LAST[0]),
        .WVALID    (MS_W_VALID[0]),
        .WREADY    (MS_W_READY[0]),

        .BMASTER   (MS_B_MASTER[0]),
        .BID       (MS_B_ID[0]),
        .BRESP     (MS_B_RESP[0]),
        .BVALID    (MS_B_VALID[0]),
        .BREADY    (MS_B_READY[0]),

        .ARMASTER  (MS_AR_MASTER[0]),
        .ARID      (MS_AR_ID[0]),
        .ARADDR    (MS_AR_ADDR[0][23:0]),
        .ARLEN     (MS_AR_LEN[0]),
        .ARSIZE    (MS_AR_SIZE[0]),
        .ARBURST   (MS_AR_BURST[0]),
        .ARLOCK    (MS_AR_LOCK[0]),
        .ARCACHE   (MS_AR_CACHE[0]),
        .ARPROT    (MS_AR_PROT[0]),
        .ARVALID   (MS_AR_VALID[0]),
        .ARREADY   (MS_AR_READY[0]),

        .RMASTER   (MS_R_MASTER[0]),
        .RID       (MS_R_ID[0]),
        .RDATA     (MS_R_DATA[0]),
        .RRESP     (MS_R_RESP[0]),
        .RLAST     (MS_R_LAST[0]),
        .RVALID    (MS_R_VALID[0]),
        .RREADY    (MS_R_READY[0]),

        .SRAM_READ_ADDRESS       (SRAM_READ_ADDR[23:0]),
        .SRAM_READ_DATA          (SRAM_READ_DATA[63:0]),
        .SRAM_OUTPUT_ENABLE      (SRAM_OE),

        .SRAM_WRITE_ADDRESS      (SRAM_WRITE_ADDR[23:0]),
        .SRAM_WRITE_DATA         (SRAM_WRITE_DATA[63:0]),
        .SRAM_WRITE_BYTE_ENABLE  (SRAM_WRITE_BE[7:0]),
        .SRAM_WRITE_STROBE       (SRAM_WRITE_STROBE)
    );

    sram #(.address_width (24), .data_width (3)) code_mem (
        .CLK                     (clock),
        .RSTn                    (!reset),

        .READ_ADDR               (SRAM_READ_ADDR[23:0]),
        .DATA_OUT                (SRAM_READ_DATA),
        .OE                      (SRAM_OE),

        .WRITE_ADDR              (SRAM_WRITE_ADDR[23:0]),
        .DATA_IN                 (SRAM_WRITE_DATA),
        .WE                      (SRAM_WRITE_STROBE),
        .BE                      (SRAM_WRITE_BE)
   );


  axi_matrix #(`pmasters, `pslaves, 1, 0) mmio_complex (

        .ACLK        (clock),
        .ARESETn     (!reset),

        .AWID        (P_AW_ID),
        .AWADDR      (P_AW_ADDR),
        .AWLEN       (P_AW_LEN),
        .AWSIZE      (P_AW_SIZE),
        .AWBURST     (P_AW_BURST),
        .AWLOCK      (P_AW_LOCK),
        .AWCACHE     (P_AW_CACHE),
        .AWPROT      (P_AW_PROT),
        .AWQOS       (P_AW_QOS),
        .AWVALID     (P_AW_VALID),
        .AWREADY     (P_AW_READY),

        .WDATA       (P_W_DATA),
        .WSTRB       (P_W_STRB),
        .WLAST       (P_W_LAST),
        .WVALID      (P_W_VALID),
        .WREADY      (P_W_READY),

        .BID         (P_B_ID),
        .BRESP       (P_B_RESP),
        .BVALID      (P_B_VALID),
        .BREADY      (P_B_READY),

        .ARID        (P_AR_ID),
        .ARADDR      (P_AR_ADDR),
        .ARLEN       (P_AR_LEN),
        .ARSIZE      (P_AR_SIZE),
        .ARBURST     (P_AR_BURST),
        .ARLOCK      (P_AR_LOCK),
        .ARCACHE     (P_AR_CACHE),
        .ARPROT      (P_AR_PROT),
        .ARQOS       (P_AR_QOS),
        .ARVALID     (P_AR_VALID),
        .ARREADY     (P_AR_READY),

        .RID         (P_R_ID),
        .RDATA       (P_R_DATA),
        .RRESP       (P_R_RESP),
        .RLAST       (P_R_LAST),
        .RVALID      (P_R_VALID),
        .RREADY      (P_R_READY),

        .S_AWMASTER  (PS_AW_MASTER),
        .S_AWID      (PS_AW_ID),
        .S_AWADDR    (PS_AW_ADDR),
        .S_AWLEN     (PS_AW_LEN),
        .S_AWSIZE    (PS_AW_SIZE),
        .S_AWBURST   (PS_AW_BURST),
        .S_AWLOCK    (PS_AW_LOCK),
        .S_AWCACHE   (PS_AW_CACHE),
        .S_AWPROT    (PS_AW_PROT),
        .S_AWQOS     (PS_AW_QOS),
        .S_AWVALID   (PS_AW_VALID),
        .S_AWREADY   (PS_AW_READY),

        .S_WMASTER   (PS_W_MASTER),
        .S_WID       (PS_W_ID),
        .S_WDATA     (PS_W_DATA),
        .S_WSTRB     (PS_W_STRB),
        .S_WLAST     (PS_W_LAST),
        .S_WVALID    (PS_W_VALID),
        .S_WREADY    (PS_W_READY),

        .S_BMASTER   (PS_B_MASTER),
        .S_BID       (PS_B_ID),
        .S_BRESP     (PS_B_RESP),
        .S_BVALID    (PS_B_VALID),
        .S_BREADY    (PS_B_READY),

        .S_ARMASTER  (PS_AR_MASTER),
        .S_ARID      (PS_AR_ID),
        .S_ARADDR    (PS_AR_ADDR),
        .S_ARLEN     (PS_AR_LEN),
        .S_ARSIZE    (PS_AR_SIZE),
        .S_ARBURST   (PS_AR_BURST),
        .S_ARLOCK    (PS_AR_LOCK),
        .S_ARCACHE   (PS_AR_CACHE),
        .S_ARPROT    (PS_AR_PROT),
        .S_ARQOS     (PS_AR_QOS),
        .S_ARVALID   (PS_AR_VALID),
        .S_ARREADY   (PS_AR_READY),

        .S_RMASTER   (PS_R_MASTER),
        .S_RID       (PS_R_ID),
        .S_RDATA     (PS_R_DATA),
        .S_RRESP     (PS_R_RESP),
        .S_RLAST     (PS_R_LAST),
        .S_RVALID    (PS_R_VALID),
        .S_RREADY    (PS_R_READY)

    );

    axi_slave_interface
        #(
        .masters   (`pmasters),
        .width     (16),
        .id_bits   (`id_bits),
        .p_size    (2),
        .b_size    (3))

        uart_if (

        .ACLK      (clock),
        .ARESETn   (!reset),

        .AWMASTER  (PS_AW_MASTER[0]),
        .AWID      (PS_AW_ID[0]),
        .AWADDR    (PS_AW_ADDR[0][15:0]),
        .AWLEN     (PS_AW_LEN[0]),
        .AWSIZE    (PS_AW_SIZE[0]),
        .AWBURST   (PS_AW_BURST[0]),
        .AWLOCK    (PS_AW_LOCK[0]),
        .AWCACHE   (PS_AW_CACHE[0]),
        .AWPROT    (PS_AW_PROT[0]),
        .AWVALID   (PS_AW_VALID[0]),
        .AWREADY   (PS_AW_READY[0]),

        .WMASTER   (PS_W_MASTER[0]),
        .WID       (PS_W_ID[0]),
        .WDATA     (PS_W_DATA[0]),
        .WSTRB     (PS_W_STRB[0]),
        .WLAST     (PS_W_LAST[0]),
        .WVALID    (PS_W_VALID[0]),
        .WREADY    (PS_W_READY[0]),

        .BMASTER   (PS_B_MASTER[0]),
        .BID       (PS_B_ID[0]),
        .BRESP     (PS_B_RESP[0]),
        .BVALID    (PS_B_VALID[0]),
        .BREADY    (PS_B_READY[0]),

        .ARMASTER  (PS_AR_MASTER[0]),
        .ARID      (PS_AR_ID[0]),
        .ARADDR    (PS_AR_ADDR[0][15:0]),
        .ARLEN     (PS_AR_LEN[0]),
        .ARSIZE    (PS_AR_SIZE[0]),
        .ARBURST   (PS_AR_BURST[0]),
        .ARLOCK    (PS_AR_LOCK[0]),
        .ARCACHE   (PS_AR_CACHE[0]),
        .ARPROT    (PS_AR_PROT[0]),
        .ARVALID   (PS_AR_VALID[0]),
        .ARREADY   (PS_AR_READY[0]),

        .RMASTER   (PS_R_MASTER[0]),
        .RID       (PS_R_ID[0]),
        .RDATA     (PS_R_DATA[0]),
        .RRESP     (PS_R_RESP[0]),
        .RLAST     (PS_R_LAST[0]),
        .RVALID    (PS_R_VALID[0]),
        .RREADY    (PS_R_READY[0]),

        .SRAM_READ_ADDRESS       (UART_READ_ADDR[15:0]),
        .SRAM_READ_DATA          (UART_READ_DATA[31:0]),
        .SRAM_OUTPUT_ENABLE      (UART_OE),

        .SRAM_WRITE_ADDRESS      (UART_WRITE_ADDR[15:0]),
        .SRAM_WRITE_DATA         (UART_WRITE_DATA[31:0]),
        .SRAM_WRITE_BYTE_ENABLE  (UART_WRITE_BE[3:0]),
        .SRAM_WRITE_STROBE       (UART_WRITE_STROBE)
    );

    uart_pl01x tty0 (
        .CLK                     (clock),
        .RSTn                    (!reset),

        .READ_ADDR               (UART_READ_ADDR[9:0]),
        .DATA_OUT                (UART_READ_DATA[31:0]),
        .OE                      (UART_OE),

        .WRITE_ADDR              (UART_WRITE_ADDR[9:0]),
        .DATA_IN                 (UART_WRITE_DATA[31:0]),
        .WE                      (UART_WRITE_STROBE),
        .BE                      (UART_WRITE_BE[3:0]),

        .CTS                     (CTS),
        .DSR                     (DSR),
        .DCD                     (DCD),
        .RI                      (RI),
        .RTS                     (RTS),
        .DTR                     (DTR),
        .OUT                     (OUT),
        .RXD                     (RXD),
        .TXD                     (TXD),

        .char_in_from_tbx        (data_in),
        .input_strobe            (dis),
        .char_out_to_tbx         (data_out),
        .output_strobe           (dos)
    );

    char_out o0 (
        .clk                     (clock),
        .resetn                  (!reset),
        .char                    (data_out),
        .strobe                  (dos)
    );

    char_in i0 (
        .clk                     (clock),
        .resetn                  (!reset),
        .char                    (data_in),
        .strobe                  (dis)
    );

    axi_slave_interface
        #(
        .masters   (`pmasters),
        .width     (16),
        .id_bits   (`id_bits),
        .p_size    (2),
        .b_size    (3))

        cat_if (

        .ACLK      (clock),
        .ARESETn   (!reset),

        .AWMASTER  (PS_AW_MASTER[1]),
        .AWID      (PS_AW_ID[1]),
        .AWADDR    (PS_AW_ADDR[1][15:0]),
        .AWLEN     (PS_AW_LEN[1]),
        .AWSIZE    (PS_AW_SIZE[1]),
        .AWBURST   (PS_AW_BURST[1]),
        .AWLOCK    (PS_AW_LOCK[1]),
        .AWCACHE   (PS_AW_CACHE[1]),
        .AWPROT    (PS_AW_PROT[1]),
        .AWVALID   (PS_AW_VALID[1]),
        .AWREADY   (PS_AW_READY[1]),

        .WMASTER   (PS_W_MASTER[1]),
        .WID       (PS_W_ID[1]),
        .WDATA     (PS_W_DATA[1]),
        .WSTRB     (PS_W_STRB[1]),
        .WLAST     (PS_W_LAST[1]),
        .WVALID    (PS_W_VALID[1]),
        .WREADY    (PS_W_READY[1]),

        .BMASTER   (PS_B_MASTER[1]),
        .BID       (PS_B_ID[1]),
        .BRESP     (PS_B_RESP[1]),
        .BVALID    (PS_B_VALID[1]),
        .BREADY    (PS_B_READY[1]),

        .ARMASTER  (PS_AR_MASTER[1]),
        .ARID      (PS_AR_ID[1]),
        .ARADDR    (PS_AR_ADDR[1][15:0]),
        .ARLEN     (PS_AR_LEN[1]),
        .ARSIZE    (PS_AR_SIZE[1]),
        .ARBURST   (PS_AR_BURST[1]),
        .ARLOCK    (PS_AR_LOCK[1]),
        .ARCACHE   (PS_AR_CACHE[1]),
        .ARPROT    (PS_AR_PROT[1]),
        .ARVALID   (PS_AR_VALID[1]),
        .ARREADY   (PS_AR_READY[1]),

        .RMASTER   (PS_R_MASTER[1]),
        .RID       (PS_R_ID[1]),
        .RDATA     (PS_R_DATA[1]),
        .RRESP     (PS_R_RESP[1]),
        .RLAST     (PS_R_LAST[1]),
        .RVALID    (PS_R_VALID[1]),
        .RREADY    (PS_R_READY[1]),

        .SRAM_READ_ADDRESS       (CAT_READ_ADDR[15:0]),
        .SRAM_READ_DATA          (CAT_READ_DATA[31:0]),
        .SRAM_OUTPUT_ENABLE      (CAT_OE),

        .SRAM_WRITE_ADDRESS      (CAT_WRITE_ADDR[15:0]),
        .SRAM_WRITE_DATA         (CAT_WRITE_DATA[31:0]),
        .SRAM_WRITE_BYTE_ENABLE  (CAT_WRITE_BE[3:0]),
        .SRAM_WRITE_STROBE       (CAT_WRITE_STROBE)
    );

    cat_accel #(14, 2) cat_accel (
        .CLK                     (clock),
        .RSTn                    (!reset),

        .READ_ADDR               (CAT_READ_ADDR[13:0]),
        .DATA_OUT                (CAT_READ_DATA[31:0]),
        .OE                      (CAT_OE),

        .WRITE_ADDR              (CAT_WRITE_ADDR[13:0]),
        .DATA_IN                 (CAT_WRITE_DATA[31:0]),
        .WE                      (CAT_WRITE_STROBE),
        .BE                      (CAT_WRITE_BE[3:0])
   );

    axi_slave_interface
        #(
        .masters   (`pmasters),
        .width     (16),
        .id_bits   (`id_bits),
        .p_size    (2),
        .b_size    (3))

        timer_if (

        .ACLK      (clock),
        .ARESETn   (!reset),

        .AWMASTER  (PS_AW_MASTER[2]),
        .AWID      (PS_AW_ID[2]),
        .AWADDR    (PS_AW_ADDR[2][15:0]),
        .AWLEN     (PS_AW_LEN[2]),
        .AWSIZE    (PS_AW_SIZE[2]),
        .AWBURST   (PS_AW_BURST[2]),
        .AWLOCK    (PS_AW_LOCK[2]),
        .AWCACHE   (PS_AW_CACHE[2]),
        .AWPROT    (PS_AW_PROT[2]),
        .AWVALID   (PS_AW_VALID[2]),
        .AWREADY   (PS_AW_READY[2]),

        .WMASTER   (PS_W_MASTER[2]),
        .WID       (PS_W_ID[2]),
        .WDATA     (PS_W_DATA[2]),
        .WSTRB     (PS_W_STRB[2]),
        .WLAST     (PS_W_LAST[2]),
        .WVALID    (PS_W_VALID[2]),
        .WREADY    (PS_W_READY[2]),

        .BMASTER   (PS_B_MASTER[2]),
        .BID       (PS_B_ID[2]),
        .BRESP     (PS_B_RESP[2]),
        .BVALID    (PS_B_VALID[2]),
        .BREADY    (PS_B_READY[2]),

        .ARMASTER  (PS_AR_MASTER[2]),
        .ARID      (PS_AR_ID[2]),
        .ARADDR    (PS_AR_ADDR[2][15:0]),
        .ARLEN     (PS_AR_LEN[2]),
        .ARSIZE    (PS_AR_SIZE[2]),
        .ARBURST   (PS_AR_BURST[2]),
        .ARLOCK    (PS_AR_LOCK[2]),
        .ARCACHE   (PS_AR_CACHE[2]),
        .ARPROT    (PS_AR_PROT[2]),
        .ARVALID   (PS_AR_VALID[2]),
        .ARREADY   (PS_AR_READY[2]),

        .RMASTER   (PS_R_MASTER[2]),
        .RID       (PS_R_ID[2]),
        .RDATA     (PS_R_DATA[2]),
        .RRESP     (PS_R_RESP[2]),
        .RLAST     (PS_R_LAST[2]),
        .RVALID    (PS_R_VALID[2]),
        .RREADY    (PS_R_READY[2]),

        .SRAM_READ_ADDRESS       (TIMER_READ_ADDR[15:0]),
        .SRAM_READ_DATA          (TIMER_READ_DATA[31:0]),
        .SRAM_OUTPUT_ENABLE      (TIMER_OE),

        .SRAM_WRITE_ADDRESS      (TIMER_WRITE_ADDR[15:0]),
        .SRAM_WRITE_DATA         (TIMER_WRITE_DATA[31:0]),
        .SRAM_WRITE_BYTE_ENABLE  (TIMER_WRITE_BE[3:0]),
        .SRAM_WRITE_STROBE       (TIMER_WRITE_STROBE)
    );


    timer timer_0 (
        .CLK                     (clock),
        .RSTn                    (!reset),

        .READ_ADDR               (TIMER_READ_ADDR[15:2]),
        .DATA_OUT                (TIMER_READ_DATA[31:0]),
        .OE                      (TIMER_OE),

        .WRITE_ADDR              (TIMER_WRITE_ADDR[15:2]),
        .DATA_IN                 (TIMER_WRITE_DATA[31:0]),
        .WE                      (TIMER_WRITE_STROBE),
        .BE                      (TIMER_WRITE_BE[3:0])
   );


  assign P_AW_ADDR[0][31] = 1'b0;
  assign P_AR_ADDR[0][31] = 1'b0;

  ExampleRocketSystem rocket_subsystem(
       .clock                                   (clock),
       .reset                                   (reset),
       .debug_clockeddmi_dmi_req_ready          (debug_clockeddmi_dmi_req_ready),
       .debug_clockeddmi_dmi_req_valid          (debug_clockeddmi_dmi_req_valid),
       .debug_clockeddmi_dmi_req_bits_addr      (debug_clockeddmi_dmi_req_bits_addr),
       .debug_clockeddmi_dmi_req_bits_data      (debug_clockeddmi_dmi_req_bits_data),
       .debug_clockeddmi_dmi_req_bits_op        (debug_clockeddmi_dmi_req_bits_op),
       .debug_clockeddmi_dmi_resp_ready         (debug_clockeddmi_dmi_resp_ready),
       .debug_clockeddmi_dmi_resp_valid         (debug_clockeddmi_dmi_resp_valid),
       .debug_clockeddmi_dmi_resp_bits_data     (debug_clockeddmi_dmi_resp_bits_data),
       .debug_clockeddmi_dmi_resp_bits_resp     (debug_clockeddmi_dmi_resp_bits_resp),
       .debug_clockeddmi_dmiClock               (debug_clockeddmi_dmiClock),
       .debug_clockeddmi_dmiReset               (debug_clockeddmi_dmiReset),
       .debug_ndreset                           (debug_ndreset),
       .debug_dmactive                          (debug_dmactive),
       .interrupts                              (interrupts),
       .mem_axi4_0_aw_ready                     (M_AW_READY[0]),
       .mem_axi4_0_aw_valid                     (M_AW_VALID[0]),
       .mem_axi4_0_aw_bits_id                   (M_AW_ID[0]),
       .mem_axi4_0_aw_bits_addr                 (M_AW_ADDR[0]),
       .mem_axi4_0_aw_bits_len                  (M_AW_LEN[0]),
       .mem_axi4_0_aw_bits_size                 (M_AW_SIZE[0]),
       .mem_axi4_0_aw_bits_burst                (M_AW_BURST[0]),
       .mem_axi4_0_aw_bits_lock                 (M_AW_LOCK[0]),
       .mem_axi4_0_aw_bits_cache                (M_AW_CACHE[0]),
       .mem_axi4_0_aw_bits_prot                 (M_AW_PROT[0]),
       .mem_axi4_0_aw_bits_qos                  (M_AW_QOS[0]),
       .mem_axi4_0_w_ready                      (M_W_READY[0]),
       .mem_axi4_0_w_valid                      (M_W_VALID[0]),
       .mem_axi4_0_w_bits_data                  (M_W_DATA[0]),
       .mem_axi4_0_w_bits_strb                  (M_W_STRB[0]),
       .mem_axi4_0_w_bits_last                  (M_W_LAST[0]),
       .mem_axi4_0_b_ready                      (M_B_READY[0]),
       .mem_axi4_0_b_valid                      (M_B_VALID[0]),
       .mem_axi4_0_b_bits_id                    (M_B_ID[0]),
       .mem_axi4_0_b_bits_resp                  (M_B_RESP[0]),
       .mem_axi4_0_ar_ready                     (M_AR_READY[0]),
       .mem_axi4_0_ar_valid                     (M_AR_VALID[0]),
       .mem_axi4_0_ar_bits_id                   (M_AR_ID[0]),
       .mem_axi4_0_ar_bits_addr                 (M_AR_ADDR[0]),
       .mem_axi4_0_ar_bits_len                  (M_AR_LEN[0]),
       .mem_axi4_0_ar_bits_size                 (M_AR_SIZE[0]),
       .mem_axi4_0_ar_bits_burst                (M_AR_BURST[0]),
       .mem_axi4_0_ar_bits_lock                 (M_AR_LOCK[0]),
       .mem_axi4_0_ar_bits_cache                (M_AR_CACHE[0]),
       .mem_axi4_0_ar_bits_prot                 (M_AR_PROT[0]),
       .mem_axi4_0_ar_bits_qos                  (M_AR_QOS[0]),
       .mem_axi4_0_r_ready                      (M_R_READY[0]),
       .mem_axi4_0_r_valid                      (M_R_VALID[0]),
       .mem_axi4_0_r_bits_id                    (M_R_ID[0]),
       .mem_axi4_0_r_bits_data                  (M_R_DATA[0]),
       .mem_axi4_0_r_bits_resp                  (M_R_RESP[0]),
       .mem_axi4_0_r_bits_last                  (M_R_LAST[0]),
       .mmio_axi4_0_aw_ready                    (P_AW_READY[0]),
       .mmio_axi4_0_aw_valid                    (P_AW_VALID[0]),
       .mmio_axi4_0_aw_bits_id                  (P_AW_ID[0]),
       .mmio_axi4_0_aw_bits_addr                (P_AW_ADDR[0][30:0]),
       .mmio_axi4_0_aw_bits_len                 (P_AW_LEN[0]),
       .mmio_axi4_0_aw_bits_size                (P_AW_SIZE[0]),
       .mmio_axi4_0_aw_bits_burst               (P_AW_BURST[0]),
       .mmio_axi4_0_aw_bits_lock                (P_AW_LOCK[0]),
       .mmio_axi4_0_aw_bits_cache               (P_AW_CACHE[0]),
       .mmio_axi4_0_aw_bits_prot                (P_AW_PROT[0]),
       .mmio_axi4_0_aw_bits_qos                 (P_AW_QOS[0]),
       .mmio_axi4_0_w_ready                     (P_W_READY[0]),
       .mmio_axi4_0_w_valid                     (P_W_VALID[0]),
       .mmio_axi4_0_w_bits_data                 (P_W_DATA[0]),
       .mmio_axi4_0_w_bits_strb                 (P_W_STRB[0]),
       .mmio_axi4_0_w_bits_last                 (P_W_LAST[0]),
       .mmio_axi4_0_b_ready                     (P_B_READY[0]),
       .mmio_axi4_0_b_valid                     (P_B_VALID[0]),
       .mmio_axi4_0_b_bits_id                   (P_B_ID[0]),
       .mmio_axi4_0_b_bits_resp                 (P_B_RESP[0]),
       .mmio_axi4_0_ar_ready                    (P_AR_READY[0]),
       .mmio_axi4_0_ar_valid                    (P_AR_VALID[0]),
       .mmio_axi4_0_ar_bits_id                  (P_AR_ID[0]),
       .mmio_axi4_0_ar_bits_addr                (P_AR_ADDR[0][30:0]),
       .mmio_axi4_0_ar_bits_len                 (P_AR_LEN[0]),
       .mmio_axi4_0_ar_bits_size                (P_AR_SIZE[0]),
       .mmio_axi4_0_ar_bits_burst               (P_AR_BURST[0]),
       .mmio_axi4_0_ar_bits_lock                (P_AR_LOCK[0]),
       .mmio_axi4_0_ar_bits_cache               (P_AR_CACHE[0]),
       .mmio_axi4_0_ar_bits_prot                (P_AR_PROT[0]),
       .mmio_axi4_0_ar_bits_qos                 (P_AR_QOS[0]),
       .mmio_axi4_0_r_ready                     (P_R_READY[0]),
       .mmio_axi4_0_r_valid                     (P_R_VALID[0]),
       .mmio_axi4_0_r_bits_id                   (P_R_ID[0]),
       .mmio_axi4_0_r_bits_data                 (P_R_DATA[0]),
       .mmio_axi4_0_r_bits_resp                 (P_R_RESP[0]),
       .mmio_axi4_0_r_bits_last                 (P_R_LAST[0]),
       .l2_frontend_bus_axi4_0_aw_ready         (l2_frontend_bus_axi4_0_aw_ready),
       .l2_frontend_bus_axi4_0_aw_valid         (l2_frontend_bus_axi4_0_aw_valid),
       .l2_frontend_bus_axi4_0_aw_bits_id       (l2_frontend_bus_axi4_0_aw_bits_id),
       .l2_frontend_bus_axi4_0_aw_bits_addr     (l2_frontend_bus_axi4_0_aw_bits_addr),
       .l2_frontend_bus_axi4_0_aw_bits_len      (l2_frontend_bus_axi4_0_aw_bits_len),
       .l2_frontend_bus_axi4_0_aw_bits_size     (l2_frontend_bus_axi4_0_aw_bits_size),
       .l2_frontend_bus_axi4_0_aw_bits_burst    (l2_frontend_bus_axi4_0_aw_bits_burst),
       .l2_frontend_bus_axi4_0_aw_bits_lock     (l2_frontend_bus_axi4_0_aw_bits_lock),
       .l2_frontend_bus_axi4_0_aw_bits_cache    (l2_frontend_bus_axi4_0_aw_bits_cache),
       .l2_frontend_bus_axi4_0_aw_bits_prot     (l2_frontend_bus_axi4_0_aw_bits_prot),
       .l2_frontend_bus_axi4_0_aw_bits_qos      (l2_frontend_bus_axi4_0_aw_bits_qos),
       .l2_frontend_bus_axi4_0_w_ready          (l2_frontend_bus_axi4_0_w_ready),
       .l2_frontend_bus_axi4_0_w_valid          (l2_frontend_bus_axi4_0_w_valid),
       .l2_frontend_bus_axi4_0_w_bits_data      (l2_frontend_bus_axi4_0_w_bits_data),
       .l2_frontend_bus_axi4_0_w_bits_strb      (l2_frontend_bus_axi4_0_w_bits_strb),
       .l2_frontend_bus_axi4_0_w_bits_last      (l2_frontend_bus_axi4_0_w_bits_last),
       .l2_frontend_bus_axi4_0_b_ready          (l2_frontend_bus_axi4_0_b_ready),
       .l2_frontend_bus_axi4_0_b_valid          (l2_frontend_bus_axi4_0_b_valid),
       .l2_frontend_bus_axi4_0_b_bits_id        (l2_frontend_bus_axi4_0_b_bits_id),
       .l2_frontend_bus_axi4_0_b_bits_resp      (l2_frontend_bus_axi4_0_b_bits_resp),
       .l2_frontend_bus_axi4_0_ar_ready         (l2_frontend_bus_axi4_0_ar_ready),
       .l2_frontend_bus_axi4_0_ar_valid         (l2_frontend_bus_axi4_0_ar_valid),
       .l2_frontend_bus_axi4_0_ar_bits_id       (l2_frontend_bus_axi4_0_ar_bits_id),
       .l2_frontend_bus_axi4_0_ar_bits_addr     (l2_frontend_bus_axi4_0_ar_bits_addr),
       .l2_frontend_bus_axi4_0_ar_bits_len      (l2_frontend_bus_axi4_0_ar_bits_len),
       .l2_frontend_bus_axi4_0_ar_bits_size     (l2_frontend_bus_axi4_0_ar_bits_size),
       .l2_frontend_bus_axi4_0_ar_bits_burst    (l2_frontend_bus_axi4_0_ar_bits_burst),
       .l2_frontend_bus_axi4_0_ar_bits_lock     (l2_frontend_bus_axi4_0_ar_bits_lock),
       .l2_frontend_bus_axi4_0_ar_bits_cache    (l2_frontend_bus_axi4_0_ar_bits_cache),
       .l2_frontend_bus_axi4_0_ar_bits_prot     (l2_frontend_bus_axi4_0_ar_bits_prot),
       .l2_frontend_bus_axi4_0_ar_bits_qos      (l2_frontend_bus_axi4_0_ar_bits_qos),
       .l2_frontend_bus_axi4_0_r_ready          (l2_frontend_bus_axi4_0_r_ready),
       .l2_frontend_bus_axi4_0_r_valid          (l2_frontend_bus_axi4_0_r_valid),
       .l2_frontend_bus_axi4_0_r_bits_id        (l2_frontend_bus_axi4_0_r_bits_id),
       .l2_frontend_bus_axi4_0_r_bits_data      (l2_frontend_bus_axi4_0_r_bits_data),
       .l2_frontend_bus_axi4_0_r_bits_resp      (l2_frontend_bus_axi4_0_r_bits_resp),
       .l2_frontend_bus_axi4_0_r_bits_last      (l2_frontend_bus_axi4_0_r_bits_last)
   );

endmodule
