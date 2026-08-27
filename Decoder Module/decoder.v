// Code your testbench here
// or browse Examples

module decoder (a,b,en,y0,y1,y2,y3);
  input wire a; // a is an input port in the form of a wire because a wire continously drives data/values in a logical circuit. in this case 'a' drives input values 1 & 0.
  input wire b; 
  input wire en;
  output reg y0;
  output reg y1;
  output reg y2;
  output reg y3;
  
  wire na;
  wire nb;
  
  
  //initial begin // declare the logic of the decoder by using gate level modeling
    not no0(na,a); // syntax: gate_name(output, input_a, input_b);
    not no1(nb,b);
  nand n1(y0, na, nb, ~en);
  nand n2(y1, na, b, ~en);
  nand n3(y2, a, nb, en);
  nand n4(y3, a, b, ~en);
  //end    why dont i need intial begin and end here??
endmodule