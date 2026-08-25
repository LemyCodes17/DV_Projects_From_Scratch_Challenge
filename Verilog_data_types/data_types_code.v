module testbench();
integer a; // intiger data type
real b; // real data type
time t; // time data type

initial begin
    a = 32'hcafe_1234; // assign a number value to a
    b = 0.12345; // assing an real value to b

    #20; // delay simulation time by 20 time units
    t = $time; // assign the current time $time to t 

  $display ("a = 0x%h", a); // this outputs a = 0xcafe1234
  $display ("b = %0.4f", b); // this outputs b = 0.1234 it means round up the 4th decimal place of this floating point number
  $display ("t = %0t", t); // this outputs t = 20. 0 means add 0 spacing before the value of t
  $display("t = %5t", t); // % means insert the data type in the brackets, t, for example in place of this "% symbol". 
                         // this oupts t =     20 and it adds 5 spaces before the val of t
end
endmodule
