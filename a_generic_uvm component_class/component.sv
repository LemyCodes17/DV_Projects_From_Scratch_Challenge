class my_component extends uvm_component;

`uvm_component_utils(my_component)

function new(string name, uvm_component parent);
    super.new(name, parent);
endfunction:constructor_func

function void build_phase();
endfunction:build_phase

function void connect_phase();
endfunction:connect_phase

task run_phase();
endtask:run_phase

endclass:my_component