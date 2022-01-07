
module timer
    (
      input          CLK,
      input          RSTn,

      input  [15:2]  READ_ADDR,
      output [31:0]  DATA_OUT,
      output         DATA_VALID,
      input          OE,

      input  [15:2]  WRITE_ADDR,
      input  [31:0]  DATA_IN,
      input          WE,
      input  [3:0]   BE
    );

    reg [31:0] time_reg;
    reg [31:0] read_data;
    reg local_data_valid;

    assign DATA_OUT = read_data;
    assign DATA_VALID = local_data_valid;

    always @(posedge CLK or (RSTn == 0)) begin
        if (RSTn == 0) begin
            time_reg <= 0;
        end else begin
            time_reg <= time_reg + 1;
        end
    end

    always @(posedge CLK) begin
        local_data_valid <= OE;
    end

    always @(posedge CLK) begin
        if (OE) begin
            read_data <= time_reg;
        end
    end

endmodule

