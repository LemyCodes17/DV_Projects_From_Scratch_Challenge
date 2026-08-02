class my_sequence extends uvm_sequence;
`uvm_object_utils(my_sequence)

int my_id;

function new(string name);
	super.new(name);
endfunction:constructor_func

task body();
endtask:body

endclass:my_sequence

