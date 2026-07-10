// this file extends from uvm sequence iterm
// the aim is to create a HTAX packet class which models a packet being transported in the HTAX
// the class has properties such as width, vc, lenght, data, delay, dest_port, of the packet etc.
//Question: Build a HTAX sequence_item from scratch given the following parameters
	// Delay must be within a reasonable send window between 1 and 20
	// Destination port must map to one of the available physical ports 0->PORTS-1
	// Virtual channel request must be a valid non-zero value
	// Length must be between 3 and 50, with the probability distribution 
    // 60% between 3 to 20, 35% between 21 to 40, and 5% between 41 t0 50, and constrained to data size.

// This class inherits from uvm_sequence_item, giving it UVM sequence-item behavior.
// In OOP, "extends" means the derived class reuses and specializes the base class.
class htax_packet extends uvm_sequence_item;

// Parameters are compile-time constants that configure the class.
// They are not randomized; they are fixed values used by the class.
parameter WIDTH = `WIDTH;   // packet payload width in bits
parameter VC = `VC;         // number of virtual channels
parameter PORTS = `PORTS;   // number of physical ports

// transaction properties
rand int length;                 // number of data words in the packet
rand bit [1:0] vc;             // virtual channel request, encoded in 2 bits
rand bit [WIDTH-1:0] data[];   // payload array of WIDTH-bit words
rand bit delay;                // randomized delay before the transfer
rand int dest_port;            // randomized destination port index

	// UVM object macro registration
	// This enables printing, copying, comparing, and debugging support.
	`uvm_object_utils_begin(htax_packet)
		`uvm_field_int(length, UVM_ALL_ON)        // register length for UVM utilities
		`uvm_field_int(vc, UVM_ALL_ON)            // register vc request
		`uvm_field_int(delay, UVM_ALL_ON)         // register delay
		`uvm_field_int(dest_port, UVM_ALL_ON)     // register destination port
		`uvm_field_array_int(data, UVM_ALL_ON)    // register payload array
	`uvm_object_utils_end

	// Constructor: called when a new object is created.
	// In object-oriented programming, a constructor initializes the new instance.
	function new (string name = "htax_packet");
		// The base class constructor must be called to initialize uvm_sequence_item internals.
		// This is important because the base class owns the UVM randomization and factory setup.
		super.new(name); //pass along the properties to the uvm_sequence_item class
	endfunction


constraint length_cons { 
    lenght >2;
    length <= 50;
    {lenght inside {[2:20]:/60, [21:40]:/35, [41:50]:/5}};
}

constraint vc_cons { vc == 11 || vc == 10 || vc == 01 ;}

constraint dest_port_cons {dest_port inside {[0:PORTS-1]};}

constraint delay_cons {delay inside [1:20];}


endclass 
