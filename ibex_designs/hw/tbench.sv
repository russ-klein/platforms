`define DONE_ADDR 32'h80F600D0
`define DONE_DATA 32'h0000DEAD

module tbench();

    logic clk = 1'b0;
    logic rst_n;

    always
       #2 clk = ~clk;

    initial begin
       rst_n = 1'b1;
       #10 rst_n = 1'b0;
       #20 rst_n = 1'b1;
    end


    top t0(
      .clk_i (clk),
      .rst_ni (rst_n)
    );

    always @(posedge clk) begin
      if ((tbench.t0.cpu0.data_be_o     == 4'hF) &&
          (tbench.t0.cpu0.data_addr_o   == `DONE_ADDR) &&
          (tbench.t0.cpu0.data_wdata_o  == `DONE_DATA))
           $finish();
    end

endmodule

