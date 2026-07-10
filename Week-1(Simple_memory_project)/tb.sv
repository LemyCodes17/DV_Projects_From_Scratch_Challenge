// simple_memory testbench.sv
// This file sets up the clock, reset, and stimulus for the simple memory design.
// It also checks the results by writing and reading all addresses.

module simple_mem_test();
    logic clk;
    logic rst_n;
    logic read_en;
    logic wr_en;
    logic [4:0] address;
    logic [7:0] data_in;
    logic [7:0] data_out;
    logic [7:0] read_data; // variable for the read data
    logic [7:0] expected_data; // variable for expected data

    // Instantiate the design under test (DUT).
    // This connects the tb signals to the simple memory module ports
    simple_mem sim_mem_inst (
        .clk(clk), // DUT clk input is driven by the local testbench clock
        .rst_n(rst_n), // DUT reset input is driven by the local reset signal
        .read_en(read_en),
        .wr_en(wr_en),
        .address(address),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Create a clock signal that toggles every 10 time units.
    always #10 clk =~clk;

    initial begin
        // Initialize signals before starting the test.
        clk = 0;
        rst_n = 0;
        read_en = 0;
        wr_en = 0;
        address = 0;
        data_in = 0;

        // Apply an asynchronous reset pulse.
        #10 rst_n <= 1;
        #1 rst_n <= 0;
        #1 rst_n <= 1;
        $display("Asynchronious memory reset");

        // Verify reset by reading every address and checking it is zero.
        for (int i = 0; i < 32; i++) begin
            mem_read(i, read_data);
            if (read_data !== 8'b0)
                $display("address %0d not reset", i);
            else
                $display("address %0d reset to 0", i);
        end
        $display("memory reset's complete");

        // Write values into all addresses.
        for (int i = 0; i < 32; i++) begin
            mem_write(i, i);
        end
        $display("Memory write complete");
        
        // Read back every value and compare with expected data.
        for (int i = 0; i < 32; i++) begin
            mem_read(i, read_data);
            expected_data=i;
            if (read_data!==expected_data)
            $display("There's a Bug in the Memory design at addr=%0d: expected=%0d got=%0d", i, expected_data, read_data);
            else 
            $display("CORRECT MEMORY VALUE DETECTED at addr=%0d: expected=%0d got=%0d", i, expected_data, read_data);
        end
        $display("Memory verification complete");
        $finish;
    end
    
        // Helper task for writing one value to the memory.
        // It asserts wr_en, places the address and data, and waits one clock.
        task mem_write(input logic [4:0] addr_in, input logic [7:0] data_wr);
         begin
            @(posedge clk);
            wr_en=1;
            read_en=0;
            address = addr_in;
            data_in = data_wr;
            @(posedge clk);
            wr_en = 0;
            $display("Writing ", data_wr," to address ", addr_in);
         end
        endtask

        // Helper task for reading one value from the memory.
        // It asserts read_en and reads data_out after a clock edge.
        task mem_read(input logic [4:0] addr_in, output logic [7:0] data_rd);
         begin
            @(posedge clk);
            wr_en = 0;
            read_en = 1;
            address = addr_in;
            @(posedge clk);
            data_rd=data_out;
            read_en=0;
            $display("Reading ",data_rd," from address ",addr_in);
        end 
        endtask

    initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, simple_mem_test);   // or your testbench module name
end
endmodule