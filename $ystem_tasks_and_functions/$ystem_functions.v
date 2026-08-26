module system_functions_$;

    reg [7:0] a; // 8-bit register a
    real b; // 64 bit floating point number by default
    reg [1:0] arr [2:0]; // 2-bit 3-wide array array of the reg data type for elements storage
    integer i; // 32 bit variable i of the intiger data type

    initial begin // at the start of this simulation 
        a = 8'b11110000;
        b = 4.0;
      for (i=0; i<3; i=i+1) begin 
        arr[i] =  2-i;
        end  // for-loop sets each index of the array, arr, = 2-i.
      
      // call the display system functions
      
      $display("a = %0b", a); // display a as a binary format
      $display("a = %0h", a); //display a as a hexadecimal format
      $display("a = %0o", a); // display a as an octal format
      $display("b = %0f", b); // display b as a floating point format
      $display("arr = %p", arr); // p means print an array.
      $displayb("arr = %p", arr); // display array as a binary format
      $displayh("arr = %p", arr); // display array as a hexadecimal format
    end
endmodule