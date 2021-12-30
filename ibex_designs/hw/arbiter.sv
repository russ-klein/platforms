
module idx(scaler_select, one_hot_select);
    parameter scaler_bits = 2;
    parameter select_bits = 4;

    output [(scaler_bits-1):0] scaler_select;
    input  [(select_bits-1):0] one_hot_select;

    reg [3:0]   local_idx;
    wire [15:0] local_select;

//  assuming that synthesis tools will strip out the unused logic

    assign local_select[(select_bits-1):0] = one_hot_select;
    assign local_select[15:select_bits] = { (16-select_bits) {1'b0}};
    assign scaler_select = local_idx[(scaler_bits-1):0];

//  there *should* be a way to "generate" this

    always @(local_select) begin
`ifndef SYNTHESIS
       if (local_select === {select_bits {1'bx}}) local_idx <= 4'b0000;
       if (local_select === {select_bits {1'bz}}) local_idx <= 4'b0000;
`endif
       if (!local_select)    local_idx <= 4'b0000;  // no selection
       if (local_select[ 0]) local_idx <= 4'b0000;
       if (local_select[ 1]) local_idx <= 4'b0001;
       if (local_select[ 2]) local_idx <= 4'b0010;
       if (local_select[ 3]) local_idx <= 4'b0011;
       if (local_select[ 4]) local_idx <= 4'b0100;
       if (local_select[ 5]) local_idx <= 4'b0101;
       if (local_select[ 6]) local_idx <= 4'b0110;
       if (local_select[ 7]) local_idx <= 4'b0111;
       if (local_select[ 8]) local_idx <= 4'b1000;
       if (local_select[ 9]) local_idx <= 4'b1001;
       if (local_select[10]) local_idx <= 4'b1010;
       if (local_select[11]) local_idx <= 4'b1011;
       if (local_select[12]) local_idx <= 4'b1100;
       if (local_select[13]) local_idx <= 4'b1101;
       if (local_select[14]) local_idx <= 4'b1110;
       if (local_select[15]) local_idx <= 4'b1111;
    end

endmodule


module arbiter 
   #(parameter masters = 2,
               slaves  = 2,
               
               addr_bits = 32,
               bus_width = 32,
               bus_bytes = 4,

               IDLE          =1,
               SAMPLE        =2,
               READ_CYCLE    =3,
               READ_ACK      =4,
               WRITE_CYCLE   =5,
               WRITE_ACK     =6,

               read_setup_time  = 0,
               write_setup_time = 0

               ) (
     input logic                                   clk_i,
     input logic                                   rst_ni,

     // master side interface

     input logic  [masters-1:0]                    requests,
     input        [masters-1:0][addr_bits-1:0]     addrs_in,
     input logic  [masters-1:0][bus_width-1:0]     wdata_in,
     input logic  [masters-1:0]                    rw,
     input logic  [masters-1:0][bus_bytes-1:0]     be,
     output logic [masters-1:0]                    grants,

     output logic [masters-1:0][bus_width-1:0]     rdata_out,
     output logic [masters-1:0]                    rvalid_out,
     output logic [masters-1:0]                    bus_error_out,

     // slave side interface

     output logic [slaves-1:0][addr_bits-1:0]      waddr_out,
     output logic [slaves-1:0][addr_bits-1:0]      raddr_out,
     output logic [slaves-1:0]                     slave_oe,
     output logic [slaves-1:0][bus_width-1:0]      wdata_out,
     output logic [slaves-1:0]                     we_out,
     output logic [slaves-1:0][bus_bytes-1:0]      be_out,

     input logic  [slaves-1:0][bus_width-1:0]      rdata_in,
     input logic  [slaves-1:0]                     rvalid_in,
     input logic  [slaves-1:0]                     wack_in

   );

   logic [4:0]               state;
   logic [4:0]               next;
   logic [9:0]               wait_time;
   logic [masters-1:0]       internal_grants;
   logic [masters-1:0]       high_bit;
   logic [masters-1:0]       master_index;

   logic [masters-1:0]       latched_master;
   logic [addr_bits-1:0]     latched_addr;
   logic [bus_width-1:0]     latched_wdata;
   logic [bus_width-1:0]     latched_rdata;
   logic                     latched_rw;
   logic [bus_bytes-1:0]     latched_be;
   logic [slaves-1:0]        slave_select;
   logic [slaves-1:0]        slave_index;

   logic [slaves-1:0]        chip_selects;
   logic                     bus_error;

   genvar x;

   assign high_bit[0] = requests[0];
   generate 
      for (x=1; x<masters; x=x+1) begin
         assign high_bit[x] = requests[x] & !requests[x-1:0];
      end
   endgenerate

   generate 
      for (x=0; x<masters; x=x+1) begin
         assign rdata_out[x] = latched_master[x] ? latched_rdata : {bus_width {1'b0}};
         assign bus_error_out[x] = latched_master[x] & bus_error;
      end
   endgenerate

   generate
      for (x=0; x<slaves; x=x+1) begin
         assign waddr_out[x] = (slave_select[x] & !latched_rw) ? latched_addr : {addr_bits {1'b0}};
         assign raddr_out[x] = (slave_select[x] &  latched_rw) ? latched_addr : {addr_bits {1'b0}};
         assign wdata_out[x] = (slave_select[x] & !latched_rw) ? latched_wdata : {bus_width {1'b0}};
         assign be_out[x]    = (slave_select[x] & !latched_rw) ? latched_be : {bus_bytes {1'b0}}; 
      end
   endgenerate

   assign grants = internal_grants;

   always @(posedge clk_i) begin
       if (rst_ni == 0'b0) begin
          next <= IDLE;
          internal_grants <= 0;
          slave_select <= {slaves {1'b0}};
          rvalid_out <= {masters {1'b0}};
          slave_oe <= {slaves {1'b0}};
          we_out <= {slaves {1'b0}};
       end else begin
          case (state)

          IDLE: begin  // wait for a master to make a request
              slave_select <= { slaves {1'b0}};
              rvalid_out <= { masters {1'b0}};
              if (high_bit) begin
                 internal_grants <= high_bit;
                 latched_master <= high_bit;
                 state <= SAMPLE;
              end else begin
                 state <= IDLE;
              end
           end

          SAMPLE: begin  // sample control/data inputs from master
              internal_grants <= 0;
              latched_addr <= addrs_in[master_index];
              latched_wdata <= wdata_in[master_index];
              latched_rw <= rw[master_index];
              latched_be <= be[master_index];
              if (rw[master_index]) begin
                 wait_time <= read_setup_time;
                 state <= READ_CYCLE;
              end else begin
                 wait_time <= write_setup_time;
                 state <= WRITE_CYCLE;
              end
           end
         
          READ_CYCLE: begin  // register read data from slave
              slave_select <= chip_selects;
              if (wait_time > 0) begin
                 wait_time = wait_time - 1;
                 state <= READ_CYCLE;
              end else begin
                 slave_oe <= chip_selects;
                 state <= READ_ACK;
              end
           end

          READ_ACK: begin 
              slave_oe <= {slaves {1'b0}};
              if (rvalid_in) begin   // wait for data to arrive
                 latched_rdata <= rdata_in[slave_index]; 
                 rvalid_out <= latched_master;
                 state <= IDLE;
              end else begin
                 state <= READ_ACK;
              end
           end

          WRITE_CYCLE: begin
              slave_select <= chip_selects;
              if (wait_time > 0) begin
                 wait_time <= wait_time - 1;
                 state <= WRITE_CYCLE;
              end else begin
                 we_out <= chip_selects;
                 state <= WRITE_ACK;
              end
           end

          WRITE_ACK: begin
              we_out <= {slaves {1'b0}};
              if (wack_in) begin   // wait for write acknowledge from slave
                 rvalid_out <= latched_master; // send ack to master
                 state <= IDLE;
              end else begin
                 state <= WRITE_ACK;
              end
           end

          default:
              state <= IDLE;

          endcase        
          
       end
    end

    chip_select #(slaves, bus_width) cs0 (latched_addr, chip_selects, bus_error);

    idx #(masters, masters) idx0 (master_index, latched_master);
    idx #(slaves, slaves)  idx1 (slave_index,  slave_select);

endmodule 
