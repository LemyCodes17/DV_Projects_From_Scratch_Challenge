class htax_driver_c extends uvm_driver(sequence_item); // htax driver class extends uvm_driver oop fundermentals 

`uvm_component_utils(htax_driver_c) // uvm component registration with uvm factory for: error reporting and task automation

function new(string name = "htax_driver_c", uvm_component parent); // htax driver class constructor  
super.new(name,parent); 
endfunction 

//build phase

//run phase

endclass