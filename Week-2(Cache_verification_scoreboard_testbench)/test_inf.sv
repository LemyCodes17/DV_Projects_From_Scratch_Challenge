interface my_inf(input clk);
  logic d;
endinterface

module dut(my_inf.mod d_inf);
  always @(posedge d_inf.clk) $display("d = %b", d_inf.d);
endmodule

module top;
  logic clk = 0;
  always #5 clk = ~clk;
  my_inf inf(clk);
  dut d(inf);
  initial begin
    inf.d = 1;
    #10;
    inf.d = 0;
    #10;
    $finish;
  end
endmodule
