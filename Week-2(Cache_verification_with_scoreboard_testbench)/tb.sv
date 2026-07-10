module cache_mem_test();


initial
begin: mem_tb

logic [4:0] expect_mem [31:0];
logic [7:0] data_out_mem;
logic [7:0] data_in_mem;
logic [7:0] data_rd;
logic [5:0] address;
int cells_reset = 0;

@(negedge system_bus.clk);
@(negedge system_bus.clk);

$display ("verifying cache reset");

if(system_bus.tb.rst_n == 1);
$display ("verifying if the mem_cache reset to 0 when rst_n is active high");

for(int i = 0; i < 32; i++);begin
    expect_mem[i] = 5'b0;
    system_bus.mem_read(i, data_rd);
    if(data_rd !== expect_mem[i]) begin
        $display("Bug: address %0d: expected = %0h, got = %0h", i, expect_mem[i], data_rd);
    end
    else
    $display("PASS: address %0d: expected = %0h, got = %0h", i, expect_mem[i], data_rd);
    cells_reset ++;
end
$display ("Number of mem cache cells reset is ", cells_reset);
end
endmodule
