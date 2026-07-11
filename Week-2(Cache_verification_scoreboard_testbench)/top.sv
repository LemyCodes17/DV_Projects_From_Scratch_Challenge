module top (); 

// Set the simulation time units used by this top module.
timeunit 1ns;
timeprecision 1ns;

// Create the clock and reset signals for the design.
logic clk = 0;
logic reset = 0;
// Clock toggles every 5ns, so the period is 10ns.
always #5 clk = ~ clk;

initial begin
    // Start reset low, then release it after 2ns.
    #1 reset = 0;
    #2 reset = 1;
    $display("asynchronious reset");
end

// Create the shared bus object (interface instance).
// The DUT and testbench both connect to this `system_bus` instance.
// It only takes clk and reset because the interface itself needs those signals too,
// and the other bus signals are declared inside the interface definition.
cache_mem_inf system_bus (clk, reset);

// Instantiate the cache design under test in top.
// Top is the top-level wrapper that connects the interface and DUT together.
// Without this instantiation, the cache memory module would not be part of the simulation.
// Connect its ports to the interface signals inside `system_bus`.
cache_mem mem_inst (
    .clk(clk),
    .reset(reset),
    .rd_en(system_bus.mem.rd_en),
    .wr_en(system_bus.mem.wr_en),
    .address(system_bus.mem.address),
    .data_in(system_bus.mem.data_in),
    .data_out(system_bus.mem.data_out)
);
cache_mem_test mem_tb (
    .system_bus(system_bus.tb)
);
endmodule
