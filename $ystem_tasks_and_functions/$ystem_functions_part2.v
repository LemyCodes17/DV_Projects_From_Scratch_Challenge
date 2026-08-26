module log_demo;
  reg [7:0] a, b; //declare two 8-bit regs a, and b
  
  initial begin 
    $monitor("monitor: a = %0d", a);
  end // monitor statement monitors evey change in the value of a
  
  initial begin
    a = 8'd8;
    b = 8'd3;
    
    #10;
    a = 8'd15;
    b <= 8'd35;
    
    $display("display b = %0d", b);
    $write("write b = %0d", b);
    $strobe("strobe b = %0d", b);
  end
endmodule
    
// $system functions discussed in this module are
// $monitor: A monitor tracks every change in a variable
// $display: Prints the output immediately
// $write: prints out the statement with no new-line appended.
// $strobe prints out the last value of the variable.
