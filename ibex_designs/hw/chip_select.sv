`include "periph_defs.svh"

module chip_select #(parameter slaves = 2,
                               addr_bits = 32)
   (
      input logic  [addr_bits-1:0]  address,
      output logic [slaves-1:0]     chip_selects,
      output logic                  bus_error
   );

`ifdef SIMULATION
   always @(address) begin
      if (address[31:`SRAM_BITS] === `SRAM_BASE)    chip_selects[`SRAM] = 1'b1;  else chip_selects[`SRAM]  = 1'b0;
      if (address[31:`UART_BITS] === `UART_BASE)    chip_selects[`UART] = 1'b1;  else chip_selects[`UART]  = 1'b0;
      if (address[31:`ACCEL_BITS] === `ACCEL_BASE)  chip_selects[`ACCEL] = 1'b1; else chip_selects[`ACCEL] = 1'b0;
      if (address[31:`TIMER_BITS] === `TIMER_BASE)  chip_selects[`TIMER] = 1'b1; else chip_selects[`TIMER] = 1'b0;
   end
   assign bus_error = !chip_selects[slaves-1:0];
`else
   assign chip_selects [`SRAM]  = (address[31:`SRAM_BITS]  == `SRAM_BASE)  ? 1'b1 : 1'b0;
   assign chip_selects [`UART]  = (address[31:`UART_BITS]  == `UART_BASE)  ? 1'b1 : 1'b0;
   assign chip_selects [`ACCEL] = (address[31:`ACCEL_BITS] == `ACCEL_BASE) ? 1'b1 : 1'b0;
   assign chip_selects [`TIMER] = (address[31:`TIMER_BITS] == `TIMER_BASE) ? 1'b1 : 1'b0;
   assign bus_error        = !chip_selects[slaves-1:0];
`endif

endmodule
