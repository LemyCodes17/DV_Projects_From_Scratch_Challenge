class htax_sequencer extends uvm_sequencer #(htax_sequence_item); //the HTAX packet sequencer class 
 
`uvm_component_utils(htax_sequencer_c) //sequencer's are UVM component's, so they're registered as uvm_component_utils in the UVM factory db.

function new (string name, uvm_component parent); // constructor function that declares two paprameters of data type string and uvm_component passes in 
                                                  // uvm_component is a user declared parameter, while string is a inbuilt property
                                                  // this is the standard function-pass structure of UVM component's all through.. Driver, Monitor etc. (pass in the name and uvm_component)
    super.new(name, parent);                      // super.new calls uvm_sequencer's constructor which stores name, parent, and registers this component in UVM tree.
                                                  // Skip this and UVM has no record that this component exists.
endfunction
                                                  // the sequencer class is set up for now...
endclass: htax_packet_c


//example sequencer 2
class cpu_sequencer extends uvm_sequencer;

`uvm_component_utils(cpu_sequencer)

function new (string name, uvm_component parent);

    super.new(name, parent);

endfunction



endclass