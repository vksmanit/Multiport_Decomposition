function port_edges = multiport_decomp_port(cktnetlist)
   modified_edges_for_network_01 = multiport_decomp_network_01(cktnetlist);
   modified_edges_for_network_02 = multiport_decomp_network_02(cktnetlist);
   modified_edges_for_port_01 = modified_edges_for_network_01(end, :);
   modified_edges_for_port_02 = modified_edges_for_network_02(end, :);
   port_edges = [modified_edges_for_port_01; modified_edges_for_port_02];
end
