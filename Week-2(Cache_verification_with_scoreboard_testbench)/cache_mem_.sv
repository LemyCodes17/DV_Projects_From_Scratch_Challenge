// This is a 4 entry cache design
// How the cache works:
// - The user provides an address (5 bits, range 0-31) and either reads or writes.
// - The address is divided by 8 to pick one of the 4 cache slots (j = addr/8).
// - Each cache slot remembers which address it holds (cache[j].addr) and the data for that address (cache[j].data).
// - On a WRITE: if the address is already cached (hit), update the cached data. If not (miss), save the old cache entry to main memory,
//   then load the new address and data into the cache.
// - On a READ: if the address is already cached (hit), return the cached data quickly. If not (miss), read from main memory,
//   save the old cache entry to main memory, then load the new address and data into the cache.
module cache_mem (
input clk,
input reset,
input rd_en,
input wr_en,
input logic [4:0] addr,
input logic [7:0] data_in,
output logic [7:0] data_out
);

typedef struct { // // grouping two related values together as one object that groups addr and data together
    logic [4:0] addr; // cached address tag for this entry
    logic [7:0] data; // cached data for this entry
} tran_t; // name for the cache entry type

logic [7:0] memory [0:31]; // the main memory array holding 32 bytes; [7:0] means each element is 8 bits wide
tran_t cache [0:3]; // the 4-entry cache storage; each entry has both an addr and data field grouped together
int j; // the selected cache slot index based on the address

always @(posedge clk or negedge reset) begin
    if (reset == 0) begin  // this is what happens during reset: clear memory and cache
        for (int i = 0; i < 32; i++)
            memory[i] <= 8'b0;
        for (int i = 0; i < 4; i++) begin
            cache[i].addr <= 5'b0; // clear the cached address tag for this slot
            cache[i].data <= 8'b0; // clear the cached data for this slot
        end
    end
    else if (wr_en == 1 && rd_en == 0) begin // write request: update cache or replace a slot
        j = addr / 8; // select one of the 4 cache slots from the 5-bit address
        if (cache[j].addr == addr) // if the selected slot already holds this address (cache hit)
            #1 cache[j].data <= data_in; // update the cached data for the hit slot
        else begin 
            memory[cache[j].addr] = cache[j].data; // on a miss, write the old cached line back to memory before replacing it
            #1 cache[j].addr <= addr; // set the new address tag for this cache slot
            cache[j].data <= data_in; // load the new write data into the cache slot 
        end
    end
    else if (wr_en == 0 && rd_en == 1) begin // read request: return data and update cache if needed
        j = addr / 8; // select the cache slot for this address
        #1 data_out <= memory[addr]; // read data from main memory and drive output
        if (cache[j].addr == addr) // if the selected slot already holds this address (cache hit)
            #1 data_out <= cache[j].data; // on a cache hit, return the cached data instead of reading from main memory (faster!)
        else begin 
            #1 data_out <= memory[addr]; // on a miss, still return the value from main memory
            memory[cache[j].addr] = cache[j].data; // save the old cached entry back to main memory before replacing it
            cache[j].addr <= addr; // update this cache slot to hold the new requested address
            cache[j].data <= memory[addr]; // fill this cache slot with the data we just read from main memory
        end
    end
end

endmodule
