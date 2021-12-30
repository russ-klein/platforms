

module mux #(
      parameter size = 2
    ) (
      input logic [size-1:0]                input_array,
      input logic [size-1:0]                selector,
      output logic                          output_data
    );

    assign output_data = (selector[0]) ? input_array[0] :
                         (selector[1]) ? input_array[1] :
                         1'b0;
endmodule
