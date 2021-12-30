`include "periph_defs.svh"

`define INSTR 0
`define DATA  1

module top (
    input logic clk_i,
    input logic rst_ni
);

    parameter masters      = 2;
    parameter slaves       = 4;
    parameter size         = 2;
    parameter bus_bytes    = (1 << size);
    parameter bus_width    = (8 * bus_bytes);
    parameter addr_bits    = 32;

    logic        test_en = 1'b0;     // enable all clock gates for testing

    // Core ID, Cluster ID and boot address are considered more or less static
    logic [ 3:0]            core_id      = 4'b0000;
    logic [ 5:0]            cluster_id   = 6'b000000;
    logic [bus_width-1:0]   boot_addr    = 32'h80000000;

    // Data memory interface
    logic                   data_req;
    logic                   data_gnt;
    logic                   data_rvalid;
    logic                   data_we;
    logic [bus_bytes-1:0]   data_be;
    logic [addr_bits-1:0]   data_addr;
    logic [bus_width-1:0]   data_wdata;
    logic [bus_width-1:0]   data_rdata;

    // Interrupt inputs
    logic                   irq;                 // level sensitive IR lines
    logic [4:0]             irq_id;
    logic                   irq_ack;             // irq ack
    logic [4:0]             irq_ack_id;

    // Debug Interface
    logic                   debug_req    = 1'b0;

    // CPU Control Signals
    logic                   fetch_enable;

    logic [masters-1:0]     requests;
    logic [masters-1:0]     grants;
    logic [slaves-1:0]      slave_grants;

    logic [addr_bits-1:0]   bus_address;
    logic [bus_width-1:0]   bus_wdata;
    logic [bus_bytes-1:0]   bus_be;
    logic                   bus_we;
    logic [bus_width-1:0]   bus_rdata;
    logic                   bus_rvalid;

    logic [masters-1:0]        bus_error;
    logic [masters-1:0][31:0]  bus_address_bundle;
    logic [masters-1:0][31:0]  bus_wdata_bundle;
    logic [masters-1:0][bus_bytes-1:0]   bus_be_bundle;
    logic [masters-1:0]        bus_we_bundle;
    logic [masters-1:0][bus_width-1:0]   bus_rdata_bundle;
    logic [masters-1:0]         bus_rvalid_bundle;

    logic [slaves-1:0][addr_bits-1:0]  slave_waddr;
    logic [slaves-1:0][addr_bits-1:0]  slave_raddr;
    logic [slaves-1:0]                 slave_oe;
    logic [slaves-1:0]                 slave_we;
    logic [slaves-1:0][bus_bytes-1:0]  slave_be;
    logic [slaves-1:0][bus_width-1:0]  slave_wdata;
    logic [slaves-1:0]                 slave_wack;

    logic [slaves-1:0][bus_width-1:0]  slave_rdata;
    logic [slaves-1:0]                 slave_rvalid;

    logic [bus_width-1:0]      uart_data;
    logic                      uart_valid = 1'b0;
    logic [bus_width-1:0]      sram_rdata;
    logic                      sram_valid;

    logic                      no_selects;
    logic [slaves-1:0]         chip_selects;
    logic [slaves-1:0]         chip_selects_delayed;
    logic                      sram_cs;
    logic                      uart_cs;

    logic                      uart_cts;
    logic                      uart_dsr;
    logic                      uart_dcd;
    logic                      uart_ri;
    logic                      uart_rts;
    logic                      uart_dtr;
    logic                      uart_out;
    logic                      uart_rxd;
    logic                      uart_txd;
  
    logic [7:0]                uart_data_in;
    logic                      uart_str_in;
    logic [7:0]                uart_data_out;
    logic                      uart_str_out;

    // instruction bus cannot write - tie these signals deasserted
    assign bus_wdata_bundle[`INSTR]   = 32'h00000000;
    assign bus_be_bundle[`INSTR]      = 4'b0000;
    assign bus_we_bundle[`INSTR]      = 1'b0;

    assign irq = 0;
    assign irq_id = 4'b0000;

    assign fetch_enable = 1;

    ibex_core cpu0 (

        // Clock and Reset
        .clk_i           (clk_i),
        .rst_ni          (rst_ni),
    
        .test_en_i       (test_en),     // enable all clock gates for testing
    
        // Core ID, Cluster ID and boot address are considered more or less static
        .core_id_i       (core_id),
        .cluster_id_i    (cluster_id),
        .boot_addr_i     (boot_addr),
    
        // Instruction memory interface
        .instr_req_o     (requests[`INSTR]),
        .instr_gnt_i     (grants[`INSTR]),
        .instr_rvalid_i  (bus_rvalid_bundle[`INSTR]),
        .instr_addr_o    (bus_address_bundle[`INSTR]),
        .instr_rdata_i   (bus_rdata_bundle[`INSTR]),
    
        // Data memory interface
        .data_req_o      (requests[`DATA]),
        .data_gnt_i      (grants[`DATA]),
        .data_rvalid_i   (bus_rvalid_bundle[`DATA]),
        .data_we_o       (bus_we_bundle[`DATA]),
        .data_be_o       (bus_be_bundle[`DATA]),
        .data_addr_o     (bus_address_bundle[`DATA]),
        .data_wdata_o    (bus_wdata_bundle[`DATA]),
        .data_rdata_i    (bus_rdata_bundle[`DATA]),
        .data_err_i      (bus_error[`DATA]),
    
        // Interrupt inputs
        .irq_i           (irq),                 // level sensitive IR lines
        .irq_id_i        (irq_id),
        .irq_ack_o       (irq_ack),             // irq ack
        .irq_id_o        (irq_ack_id),
    
        // Debug Interface
        .debug_req_i     (debug_req),
        
        // CPU Control Signals
        .fetch_enable_i  (fetch_enable)
    
    );

    arbiter #(
        .masters            (masters),
        .slaves             (slaves)
      ) arb0 (
        .clk_i              (clk_i),
        .rst_ni             (rst_ni),

        .requests           (requests),
        .addrs_in           (bus_address_bundle),
        .wdata_in           (bus_wdata_bundle),
        .rw                 (requests & ~bus_we_bundle),
        .be                 (bus_be_bundle),
        .grants             (grants), 
   
        .rdata_out          (bus_rdata_bundle),
        .rvalid_out         (bus_rvalid_bundle),
        .bus_error_out      (bus_error),
   
        .waddr_out          (slave_waddr),
        .raddr_out          (slave_raddr),
        .slave_oe           (slave_oe),
        .wdata_out          (slave_wdata),
        .we_out             (slave_we),
        .be_out             (slave_be),
   
        .rdata_in           (slave_rdata),
        .rvalid_in          (slave_rvalid),
        .wack_in            (slave_wack)
    );

    sram #(`SRAM_BITS-2) s0 (
        .CLK                (clk_i),
        .RSTn               (rst_ni),
        .READ_ADDR          (slave_raddr[`SRAM][`SRAM_BITS-1:2]),
        .DATA_OUT           (slave_rdata[`SRAM]),
        .DATA_VALID         (slave_rvalid[`SRAM]),
        .OE                 (slave_oe[`SRAM]),
        .WRITE_ADDR         (slave_waddr[`SRAM][`SRAM_BITS-1:2]),
        .DATA_IN            (slave_wdata[`SRAM]),
        .BE                 (slave_be[`SRAM]),
        .WE                 (slave_we[`SRAM]),
        .WACK               (slave_wack[`SRAM])
    );

    cat_accel #(`ACCEL_BITS-2) a0 (
        .CLK                (clk_i),
        .RSTn               (rst_ni),
        .READ_ADDR          (slave_raddr[`ACCEL][`ACCEL_BITS-1:2]),
        .DATA_OUT           (slave_rdata[`ACCEL]),
        .DATA_VALID         (slave_rvalid[`ACCEL]),
        .OE                 (slave_oe[`ACCEL]),
        .WRITE_ADDR         (slave_waddr[`ACCEL][`ACCEL_BITS-1:2]),
        .DATA_IN            (slave_wdata[`ACCEL]),
        .BE                 (slave_be[`ACCEL]),
        .WE                 (slave_we[`ACCEL]),
        .WACK               (slave_wack[`ACCEL])
    );

    timer #(`TIMER_BITS-2) t0 (
        .CLK                (clk_i),
        .RSTn               (rst_ni),
        .READ_ADDR          (slave_raddr[`TIMER][`TIMER_BITS-1:2]),
        .DATA_OUT           (slave_rdata[`TIMER]),
        .DATA_VALID         (slave_rvalid[`TIMER]),
        .OE                 (slave_oe[`TIMER]),
        .WRITE_ADDR         (slave_waddr[`TIMER][`TIMER_BITS-1:2]),
        .DATA_IN            (slave_wdata[`TIMER]),
        .BE                 (slave_be[`TIMER]),
        .WE                 (slave_we[`TIMER]),
        .WACK               (slave_wack[`TIMER])
    );

    uart #(`UART_BITS-2) u0 (
        .CLOCK              (clk_i),
        .RESETn             (rst_ni),

        .READ_ADDRESS       (slave_raddr[`UART][`UART_BITS-1:2]),
        .READ_DATA          (slave_rdata[`UART]),
        .DATA_VALID         (slave_rvalid[`UART]),
        .OE                 (slave_oe[`UART]),
        .WRITE_ADDRESS      (slave_waddr[`UART][`UART_BITS-1:2]),
        .WRITE_DATA         (slave_wdata[`UART]),
        .BE                 (slave_be[`UART]),
        .WE                 (slave_we[`UART]),
        .WACK               (slave_wack[`UART]),

        .CTS                (uart_cts),
        .DSR                (uart_dsr),
        .DCD                (uart_dcd),
        .RI                 (uart_ri),
        .RTS                (uart_rts),
        .DTR                (uart_dtr),
        .OUT                (uart_out),
        .RXD                (uart_rxd),
        .TXD                (uart_txd),
  
        .char_in_from_tbx   (uart_data_in),
        .input_strobe       (uart_str_in),
        .char_out_to_tbx    (uart_data_out),
        .output_strobe      (uart_str_out)

    );

    char_out o0 (
        .clk                (clk_i),
        .resetn             (rst_ni),
        .char               (uart_data_out),
        .strobe             (uart_str_out)
    );

    char_in i0 (
        .clk                (clk_i),
        .resetn             (rst_ni),
        .char               (uart_data_in),
        .strobe             (uart_str_in)
    );


endmodule
