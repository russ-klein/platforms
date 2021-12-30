

module bus_fifo
    (
        CLK,
        RESET_N,
        DATA_STROBE,
        DATA_IN,
        DATA_READY,
        DATA_OUT,
        DATA_ACK,
        FULL
    );

    parameter width = 8;
    parameter depth = 8;

    input               CLK;
    input               RESET_N;
    input               DATA_STROBE;
    input  [width-1:0]  DATA_IN;
    output              DATA_READY;
    output [width-1:0]  DATA_OUT;
    input               DATA_ACK;
    output              FULL;

    reg    [width-1:0]  fifo_mem[(1<<depth)-1:0];
    reg    [depth-1:0]  input_pointer;
    reg    [depth-1:0]  output_pointer;

    reg    [31:0]       one = 32'h00000001;
    reg    [31:0]       zero = 32'h00000000;
    reg    [31:0]       zee = 32'hzzzzzzzz;

    wire                empty;
    wire   [depth:0]    input_pointer_plus_one;

    assign empty = (input_pointer == output_pointer) ? 1'b1 : 1'b0;
    assign FULL  = (input_pointer_plus_one == output_pointer) ? 1'b1 : 1'b0;
    assign DATA_READY = !empty;

    assign input_pointer_plus_one = input_pointer + one;
    assign DATA_OUT = (empty) ? zee : fifo_mem[output_pointer];

    always @(posedge CLK) begin
        
        if (!RESET_N) begin 
            input_pointer <= zero;
            output_pointer <= zero;
        end else begin
            if (DATA_STROBE & !FULL) begin
                fifo_mem[input_pointer] <= DATA_IN;
                input_pointer <= input_pointer + one;
            end
            if (DATA_ACK & !empty) begin
                output_pointer <= output_pointer + one;
            end
        end
    end

endmodule
