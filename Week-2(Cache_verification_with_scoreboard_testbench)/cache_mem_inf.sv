// The interface groups the cache bus signals and helper tasks
// It is a shared object that both the DUT and the testbench use
interface cache_mem_inf (input clk, input reset); // my final question is tell me why I need this chared object for DUT and tb?

// Signals the cache uses for address, data, and control
logic [4:0] address;
logic [7:0] data_in;
logic [7:0] data_out;
logic rd_en;
logic wr_en;

// The tb modport is the testbench view of the cache mem interface
// It can drive the request signals and read back the outputs
// It also imports tasks so the testbench can use them directly
modport tb (
    output data_in,
    output address,
    output rd_en,
    output wr_en,
    input clk,
    input reset,
    input data_out,
    import mem_write,
    import mem_read
);
// The memory modport is the DUT view of the interface
// The DUT reads the input signals and writes the output data 
modport mem (
    input data_in,
    input address,
    input rd_en,
    input wr_en,
    output data_out
);

// These tasks are helper operations for the testbench.
// They drive the interface signals on the negative edge of the clock
// to perform a write or read transaction.

// Task for writing into the cache interface //is this for writing into the cache interface or into the cache??
task mem_write(input logic [4:0] addr_in, input logic [7:0] data_wr);
    @(negedge clk);
        wr_en <= 1;
        rd_en <= 0;
        address <= addr_in;
        data_in <= data_wr;
    @(negedge clk);
        wr_en = 0;
        $display("write data : %0d to address : %0h", data_wr, address);
endtask

// Task for reading one byte from the cache interface. //is this for reading into the cache interface or into the cache??
task mem_read(input logic [4:0] addr_in, output logic [7:0] data_rd);
    @(negedge clk);
        wr_en <= 0;
        rd_en <= 1;
        address <= addr_in;
        data_rd <= data_out;
    @(negedge clk);
        rd_en <= 0;
        $display("read data : %0d from address : %0h", data_rd, address);
endtask

endinterface
