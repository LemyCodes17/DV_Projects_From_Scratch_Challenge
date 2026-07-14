# HTAX UVM Sequence Item
`htax_packet` extends `uvm_sequence_item` and models a single packet transported across the HTAX network. It defines the transaction's properties and the constraints used to generate valid, randomized traffic.
 
## 1. Sequence Item Properties
The HTAX packet contains the following fields.
 
1. dest_port: The destination port where the packet is routed to.
2. vc: The virtual channel requested by the packet.
3. length: The packet size.
4. delay: Packet injection delay.
5. data: The payload array carried by the packet.

## 2. Task:
Design the htax_packet sequence item with the following design constraints:
 
1. `delay_cons`: Delay must fall within a reasonable send window: `1 <= delay <= 20`.
2. `dest_port_cons` Destination port must map to a valid physical port: `dest_port inside {[0:PORTS-1]}`.
3. `vc_cons` Virtual channel request must be a valid, non-zero value.
4. `length_cons` Length must be between 3 and 50, following this distribution:
   - 60% between 3 and 20
   - 35% between 21 and 40
   - 5% between 41 and 50
   
   Length must also be constrained to the payload data size.

