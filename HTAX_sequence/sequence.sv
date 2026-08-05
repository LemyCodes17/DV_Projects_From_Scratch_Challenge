// UVM sequences

// 1. A sequence is a UVM object that generates transactions or (sequence items).
// 2. #(htax_packet_c) is the sequence_item class this sequence generates;  and 'req' is transaction object created from that class.

// 3. A sequence generates transactions and sends them through a sequencer to the driver. 
// 4. The driver sends pin level activities to the DUT interface.

// 5. The sequence class is registered as an object for uvm factory automation because it moves in the uvm testbench.

// 6. The constructor creates and initializes the sequence object; calling super.new() and assigning its name.

// 7. The sequence class has a ONE body task, and in here the task method does whatever it is that the sequence does!! 
    // Step 1: Create the transaction
    // Step 2: Call the function start_item() to notify the driver that you're ready to send over the packet
    // Step 3: Randomize the transaction
    // Step 4: Hand off the transaction to the driver by calling finish_item() method 
    // `uvm_do and `uvm_do_with perform all 4 steps in one line for ease.

class htax_sequence extends uvm_sequence #(htax_packet_c);

  `uvm_object_utils(htax_sequence)

  function new(string name = "htax_sequence");
    super.new(name);
  endfunction

  task body();

    // 1. Create transaction via the factory
    req = htax_packet_c::type_id::create("req");

    // 2. notify the driver that the sequence is ready to send a request and Wait until the driver is ready
    start_item(req);

    // 3. Randomize the transaction
    if (!req.randomize()) 
      `uvm_error(get_type_name(), "Randomization failed")

    // 4. Send transaction to the driver
    finish_item(req);

  endtask : body

endclass : htax_sequence


class do_sequence  extends uvm_sequence #(sequence_item);

  `uvm_object_utils(do_sequence)

  function new(string name = "do_sequence");
    super.new(name);
  endfunction

  task body();
    `uvm_do(req) // since we wrote class htax_example_seq extends uvm_sequence #(sequence_item);
                 // uvm automatically creates a parameter called "req" under the hood as shown in lines 35
  endtask : body

endclass : do_sequence


class do_with_sequence extends uvm_sequence #(sequence_item);

  `uvm_object_utils(do_with_sequence)

  function new(string name = "do_with_sequence");
    super.new(name);
  endfunction

  task body();
    `uvm_do_with(req, { opcode == WRITE; req.length > 3})
  endtask : body

endclass : do_with_sequence
