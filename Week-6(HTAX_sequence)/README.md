# HTAX UVM Sequence
HTAX (Hierarchical Transport Architecture) is a packet-based transport protocol. This folder generates HTAX packet transactions with different traffic patterns with specified constraints.
 
## 1. Sequence Item Properties
The HTAX packet contain the following fields.
 
1. dest_port: The destination port where the packet is routed to in the .
2. vc: The Virtual channel assigned to the packet.
3. length: The packet size.
4. delay: Packet injection delay.

## 2. Task:
Design UVM sequences for the HTAX network that generate specific packet traffic patterns using sequence-level constraints. Create a base sequence `fix_dest_port_seq` should be used as the reference implementation. Implement the following sequences:
 
1. short_packet_seq
Generate packets where:
`3 <= length <= 10`
2. `long_packet_short_delay_seq`
Generate packets where:
`40 <= length <= 50`
and:
`delay < 5`
3. `med_packet_fix_vc_seq`
Generate packets where:
`10 <= length <= 40`
The virtual channel (`vc`) must be fixed for the entire burst — chosen once per sequence run to be either VC-0 or VC-1, then held constant across all generated packets.
4. `random_seq`
Generate packets using the default HTAX packet constraints without adding additional sequence-level constraints.