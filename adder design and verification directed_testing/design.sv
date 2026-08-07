module adder(a,b,c_in,c_out,sum);
  input logic [7:0] a;
  input logic [7:0] b;
  input logic c_in;
  
  output logic c_out;
  output logic [7:0] sum;
  
  logic [8:0] result; //internal declared variable
  
  assign result = a+b+c_in; //description of circuit functionality
  assign sum = result [7:0];
  assign c_out = result [8];
  
endmodule:adder
  
  