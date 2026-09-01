module parameter_example #(parameter data_width = 8, id_width = 32) (data, id); // a parameter is a declared constant value in module block
  
  input bit [data_width-1:0] data;
  input bit [id_width-1:0] id;
  
  initial begin // behavioral modelling initial block
    $display ("data_width = %0d, id_width = %0d", data_width, id_width);
    
    // display variables (i'm not sure why here?)
    $display("data = %0d, id = %0d", data, id);
    
  end
endmodule