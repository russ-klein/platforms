
module bus_mux #(
      parameter size = 2,
                bus_width = 32
    ) (
      input logic [size-1:0][bus_width-1:0] input_array,
      input logic [size-1:0]                selector,
      output logic [bus_width-1:0]          output_data
    );

    assign output_data = (selector[0]) ? input_array[0] :
                         (selector[1]) ? input_array[1] :
                         { bus_width {1'bz} };
endmodule
