function incidence_matrix_for_port = multiport_decomp_incidence_matrix_for_port(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : incidence_matrix_for_port = multiport_decomp_incidence_matrix_for_port(cktnetlist)
% --------------------------------------------------------------------------------  
    [A1g_n1, A2g_n1, A2e_n1] = multiport_decomp_incidence_matrix_for_network_01(cktnetlist);
    [A1g_n2, A2g_n2, A2e_n2] = multiport_decomp_incidence_matrix_for_network_02(cktnetlist);
    incidence_matrix_for_port = [A2e_n1, A2e_n2];
   %port_edges = multiport_decomp_port(cktnetlist);
   %common_nodes = multiport_decomp_common_nodes(cktnetlist);
   %common_nodes_index = find(common_nodes);
   %number_of_ports = size(port_edges,1);
   %incidence_matrix_for_port = (zeros(length(common_nodes_index),number_of_ports));
   %for i = 1: number_of_ports
   %    incidence_matrix_for_port (port_edges(i,1),i) = 1;
   %    incidence_matrix_for_port (port_edges(i,2),i) = -1;
   %end
   %incidence_matrix_for_port = incidence_matrix_for_port(common_nodes_index, :);
end
