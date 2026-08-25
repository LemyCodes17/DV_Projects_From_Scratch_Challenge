module half_adder(input a,b, output sum, carry);
    sum = a ^ b;
    carry = a & b;
    
endmodule
