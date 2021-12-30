
module sram
    (
        CLK,
        RSTn,
        READ_ADDR,
        DATA_OUT,
        DATA_VALID,
        OE,
        WRITE_ADDR,
        DATA_IN,
        BE,
        WE,
        WACK
    );

    parameter address_width     = 16;
    parameter data_width        = 2; //   in 2^data_width bytes
                                     //   0 = 8 bits  1 = 16 bits  2 = 32 bits  3 = 64 bits
                                     //   memory is always byte addressible

    input                                CLK;
    input                                RSTn;
    input [address_width-1:0]            READ_ADDR;
    output [((1<<data_width)*8)-1:0]     DATA_OUT;
    output                               DATA_VALID;
    input                                OE;
    input [address_width-1:0]            WRITE_ADDR;
    input [((1<<data_width)*8)-1:0]      DATA_IN;
    input [(1<<data_width)-1:0]          BE;
    input                                WE;
    output                               WACK;
   
    reg [31:0] time_reg;
    reg [((1<<data_width)*8)-1:0] mem [(1<<address_width)-1:0];
    reg [((1<<data_width)*8)-1:0] read_data;
    reg [(1<<data_width)-1:0] local_be;
    reg local_we;
    reg local_data_valid;
    reg local_wack;

    genvar w;

    assign DATA_OUT = read_data;
    assign DATA_VALID = local_data_valid;
    always @(posedge CLK) begin
       local_wack <= (WE && BE) ? 1'b1 : 1'b0;
    end

    assign WACK = local_wack;

    always @(posedge CLK or (RSTn == 0)) begin
        if (RSTn == 0) begin
            time_reg <= 0;
        end else begin
            time_reg <= time_reg + 1;
        end
    end
        
    always @(posedge CLK) begin
        local_we <= WE;
        local_be <= BE;
        local_data_valid <= OE;
    end 

    always @(posedge CLK) begin
        if (OE) begin
            read_data <= mem[READ_ADDR];
            //$display("read: ", mem[READ_ADDR], " from: ", READ_ADDR);
        end
    end

    generate for (w=0; w<(1<<data_width); w=w+1) 
        always @(posedge CLK) begin
            if (local_we && local_be[w]) begin
                mem[WRITE_ADDR][((w+1)*8)-1:(w*8)] <= DATA_IN[((w+1)*8)-1:(w*8)];
                //$display("wrote  byte: ", w, " @", WRITE_ADDR);
            end
        end
    endgenerate

endmodule
