# 1. Sequence 
This file contains the HTAX sequence definitions used to generate packet transactions. The goal is to develop UVM sequences that generate different HTAX packet traffic patterns by applying sequence-level constraints.

## 2. HTAX Packet Specification
HTAX packets contain the following fields:

1. `dest_port`: Destination port where the packet is routed.
2. `vc`: Virtual channel assigned to the packet.
3. `length`: Packet size.
4. `delay`: Packet injection delay.

## 3. Task

Develop UVM sequences for the HTAX network that generate specific packet traffic patterns using sequence-level constraints. The provided sequence `fix_dest_port_seq` should be used as the reference implementation. Implement the following sequences:

1. `short_packet_seq`
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
The virtual channel (`vc`) must remain fixed to either VC-0 or VC-1 for all generated packets.

4. `random_seq`
Generate packets using the default HTAX packet constraints without adding additional sequence-level constraints.
