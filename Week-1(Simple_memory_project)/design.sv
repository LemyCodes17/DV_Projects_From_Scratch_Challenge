//  This is a simple memory systemverilog desig.sv module.
//  Design specifications 
//  It stores 32 bytes and uses a 5-bit address range from 0 to 31.
//  Simple Memory access is synchronous with asynchronous reset(rst_n)
//  Write data_in into the simple memory on posedge of clk only when wr_en=1
//  Place simple memory[addr] onto data_out bus on posedge of clk only when rd_en=1
// Only one request is allowed at a time: either write or read, not both.
// On reset, every memory location is cleared to zero.

module simple_mem (
    input clk,
    input rst_n,
    input read_en,
    input wr_en,
    input logic [4:0] address,
    input logic [7:0] data_in,
    output logic [7:0] data_out
);

  // The memory array stores 32 bytes.
  // It is the internal storage for this simple memory module.
  logic [7:0] memory [0:31];

  // This always block describes the memory behavior.
  // It runs on the rising edge of clk, or when reset goes low.
  // Reset is asynchronous, so it can clear memory immediately when rst_n goes low.
  always @(posedge clk or negedge rst_n) begin
    if (rst_n == 0) begin
        for (int i = 0; i < 32; i++)
            memory[i] <= 8'b0;
    end
    else if ((wr_en == 1) && (read_en == 0)) begin
        // Write data into the memory at the given address.
        // Non-blocking assignment is used because this is sequential logic on a clock edge.
        #1 memory[address] <= data_in;
    end
    else if ((wr_en == 0) && (read_en == 1)) begin
        // Read data from memory and drive data_out.
        #1 data_out <= memory[address];
    end
  end
endmodule
