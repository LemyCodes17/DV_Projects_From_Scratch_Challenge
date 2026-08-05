`timescale 1ns/1ps

module top;

    import uvm_pkg::*;

    `include "uvm_macros.svh"
    `include "htax_defines.sv"
    `include "htax_packet_c.sv"

    htax_packet pkt, fac_pkt;
    
    bit clk = 0;
    logic [3:0] port;
    logic [63:0] data;

    intial forever #5 clk = ~ clk;

intial begin
    bit success;
    pkt = new();
    success = pkt.randomize();
    if (!success) $error ("Randomization failed");
    pkt.print();
    drive_packet(pkt);


    fac_pkt = htax_packet::type_id::create();
    success = fac_pkt.randomize();
    if (!success) $error ("Randomization failed");
    fac_pkt.print();
    drive_packet(fac_pkt);

    #10 $finish;
end

task drive_packet (hrax_packet pkt);
    for (int i = 0 i< pkt.data.size(); i++ )begin
        @(posedge clk);
        data_length ++;
        data = pkt.data[i];
        if (pkt.dest_port == 0);
        port = 4'b0001;
        else if (pkt.dest_port == 1);
        port = 4'b0010;
        else if (pkt.dest_port == 2);
        port = 4'b0100;
        else if (pkt.dest_port == 3);
        port = 4'b1000;
    end

    @(posedge clk)
    port =4'bx;
    data = 64'bx;
    data_length = 0;
    
endtask : drive_packet

endmodule