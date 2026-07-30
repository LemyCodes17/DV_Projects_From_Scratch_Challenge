class htax_driver_c extends uvm_driver #(sequence_item); // htax driver class parametrized with sequence item

// virtual interface
virtual htax_if vif;

// create user defined class
`uvm_component_utils(htax_driver_c) // uvm component registration with uvm factory for: error reporting and task automation

function new(string name = "htax_driver_c", uvm_component parent = null); // htax driver class constructor  
    super.new(name,parent); 
endfunction:new

//build phase
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

//run phase
task run_phase(uvm_phase phase);   
forever begin
    seq_item_port.get_next_item(req); //request a new transaction
    drive_thru_dut(req); // send transaction to the DUT
    seq_item_port.item_done(); // driver is done with the transaction
end
endtask

extern protected task drive_thru_dut(sequence_item pkt);

endclass

task htax_driver_c::drive_thru_dut(sequence_item pkt);
    `uvm_info (get_type_name(), $sformatf("Input Data Packet to DUT : \n%s", pkt.sprint()), UVM_NONE)
    `uvm_info (get_type_name(), $sformatf("Ended Driving Data packet to DUT"), UVM_NONE)
endtask:drive_thru_dut


