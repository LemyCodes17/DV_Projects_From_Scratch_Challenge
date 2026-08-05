//example sequencer 2
class cpu_sequencer extends uvm_sequencer;

`uvm_component_utils(cpu_sequencer)

function new (string name, uvm_component parent);

    super.new(name,parent);

endfunction

endclass