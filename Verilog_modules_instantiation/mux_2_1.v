module mux_2_1 (input sel, i0, i1, output y);

    assign y = sel ? i1 : i0;
endmodule


