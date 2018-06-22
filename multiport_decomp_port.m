function port_incidenc_matrix = multiport_decomp_port(cktnetlist)
    [modified_edges_for_network_01, number_of_port_branch_in_network_01] = multiport_decomp_network_01(cktnetlist);
    [modified_edges_for_network_02, number_of_port_branch_in_network_02] = multiport_decomp_network_02(cktnetlist);
    port_of_network_01 = modified_edges_for_network_01(end-number_of_port_branch_in_network_01 + 1:end,:);
    port_of_network_02 = modified_edges_for_network_02(end-number_of_port_branch_in_network_02 + 1:end,:);
    %port_edges = [port_of_network_01; port_of_network_02]; 

   %%%%%%%%%%% for ckt-04 %%%%%%%%%%
   [modified_edges_for_network_03, number_of_port_branch_in_network_03] = multiport_decomp_network_03(cktnetlist);
   port_of_network_03 = modified_edges_for_network_03(end-number_of_port_branch_in_network_03 + 1:end,:);
   port_edges = [port_of_network_01; port_of_network_02; port_of_network_03];

    rows = length(unique(port_edges));
    cols = size(port_edges,1);
    port_incidenc_matrix = zeros(rows,cols);
    for i = 1:cols 
        if (port_edges(i,1) ~= port_edges(i,2))
            port_incidenc_matrix(port_edges(i,1),i) = +1;
            port_incidenc_matrix(port_edges(i,2),i) = -1;
        end
    end
    port_incidenc_matrix = port_incidenc_matrix(unique(port_edges),:);

 % modified_edges_for_network_01 = multiport_decomp_network_01(cktnetlist);
 % modified_edges_for_network_02 = multiport_decomp_network_02(cktnetlist);
 % modified_edges_for_port_01 = modified_edges_for_network_01(end, :);
 % modified_edges_for_port_02 = modified_edges_for_network_02(end, :);
 % port_edges = [modified_edges_for_port_01; modified_edges_for_port_02];
end
