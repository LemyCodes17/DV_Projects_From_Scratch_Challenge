module testbench();    
    logic [7:0] tb_a;
    logic [7:0] tb_b;
    logic tb_c_in;
    logic tb_c_out;
    logic [7:0] tb_sum;
  
  // connect tb signals to design to drive test values to 'em
  // dut_module_name tb_instance_name (port_connections);  
  // port_connections equates to .dut_port_name(testbench_port_name);
  // intial means do this once in the simulation
  
  adder tb_adder (.a(tb_a), .b(tb_b), .c_in(tb_c_in), .c_out(tb_c_out), .sum(tb_sum)); // design module connected
  
  // drive signals to the design
  
  initial begin
    #1; // one clock-cycle ns delay
    tb_a = 1;
    tb_b = 2;
    tb_c_in = 1;
    
    #1; // one clock-cycle ns delay
    tb_a = 2;
    tb_b = 3;
    tb_c_in = 4;
    
    #1; // one clock-cycle ns delay
    tb_a = 5;
    tb_b = 6;
    tb_c_in = 7;
    
    #1; // one clock-cycle ns delay
    tb_a = 8;
    $finish(); // ends the testbench simulation
    
  end
  
	// to dump signals to waveform
  	initial begin
      $dumpfile("dump.vcd"); 
      $dumpvars;
    end
  
endmodule:testbench


  