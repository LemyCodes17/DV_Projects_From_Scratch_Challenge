class my_transaction extends uvm_sequence_item;
`uvm_object_utils(my_transaction)

rand bit [3:0] length;
rand bit [31:0] data[];

constraint lenght_cons {length >= 1;}

function new(string name);
    super.new(name);
endfunction

function void do_copy();
endfunction

function void do_compare();
endfunction

endclass:my_transaction