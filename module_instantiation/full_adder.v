module full_adder(input a,b,c_in output sum, cin);

    wire c,c1,s; // wires are declared to drive signals in the circuit
    
    half_adder ha0(a,b,s,c); // half_adder module instantiation: adds a + b
                             // s = initial sum, c = resulting carry.

    half_adder ha1(cin,s,sum,c1); // half_adder module instantiation: adds c_in + s.
                                  // sum = final sum, c1 = second resulting carry.
    assign carry = c | c1; // ORs the two carry signals to result in the final carry

endmodule
// this full adder verilog module uses a data-flow level of abstraction, and a bottom-up design.