// Code your design here

module example;
reg [6:0] mem1; // a single-element 7-bit vector mem1
reg [7:0] mem2 [3:0]; // an 8 bit array mem2 of data-type reg with 4 elements
reg [9:0] mem3 [7:0] [4:0]; // a 10 bit array mem3 of data-type reg with 8 rows and 5 columns

initial begin 
  
  int i;
  int j;
  
  mem1 = 7'h9; // assign a value to the vector one-element (variable) mem1
  mem2[0] = 8'h6;
  mem2[1] = 8'h9;
  mem2[2] = 8'h13;
  mem2[3] = 8'h4;
  
  for (i=0; i<4; i++) begin
    $display("mem2[%0d] = %0h",i,mem2[i]);
  end
  
  for (i=0; i<8; i++) begin // this line goes trough the 8 rows in my memory //width
    for (j=0; j<5; j++) begin // this for loop goes through the 5 columns. The value of j increases first before i //height
        mem3[i][j] = i+j;
        $display("mem3[%0d][%0d] = %0h",i,j,mem3[i][j]);
      end
    end
  
end
endmodule    
  