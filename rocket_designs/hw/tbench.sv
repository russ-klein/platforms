`define DONE_ADDR 10'h000
`define DONE_DATA 32'h000000FF

module tbench();

    logic clk = 1'b0;
    logic rst;

    always
       #2 clk = ~clk;

    initial begin
       rst = 1'b1;
       #100 rst = 1'b0;
    end


    top t0(
      .clock (clk),
      .reset (rst)
    );

    always @(posedge clk) begin
      if ((tbench.t0.tty0.WE              == 1'b1) &&
          (tbench.t0.tty0.WRITE_ADDR      == `DONE_ADDR) &&
          (tbench.t0.tty0.DATA_IN         == `DONE_DATA))
           $finish();
    end

endmodule

