module mux_4_1(
	input sel0, sel1, 
  	input i0, i1, i2, i3, 
  	output reg y);

    wire y0, y1; // wires are used to connect two modules together and drive the signals through the circuit

    mux_2_1 m1(sel1, i2, i3, y1); // copy of parent module
    mux_2_1 m2(sel1, i0, i1, y0); // copy of parent module
    mux_2_1 m3(sel0, y0, y1, y); // copy of parent module
endmodule