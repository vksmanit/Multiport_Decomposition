function modified_edges_for_network_02 =  multiport_decomp_network_02(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : modified_edges_for_network_02 = multiport_decomp_network_02(cktnetlist)
% --------------------------------------------------------------------------------
    common_nodes = multiport_decomp_common_nodes(cktnetlist);
    common_nodes_index = find(common_nodes);
    %%%%% partition_simple can be patition in more general or can be hardcoded %%%%%
    partition_simple = multiport_decomp_partition_simple(cktnetlist);
    N = length(cktnetlist.nodenames)+1;
    modified_edges_for_network_02 = [];
    for i = 1: length(cktnetlist.elements)
        if (partition_simple(i) == 0) 
            edge = cktnetlist.elements{i}.nodes;
            node1 = edge(1,1);
            node2 = edge(1,2);
            if (strcmp(node1,'gnd'))
                node1 = N;
            else 
                node1 = str2num(cell2mat(node1));
            end
            if (strcmp(node2,'gnd'))
                node2 = N;
            else 
                node2 = str2num(cell2mat(node2));
            end
            modified_edges_for_network_02 = [modified_edges_for_network_02; node1 node2];
        end 
    end
    %%%%%%%%%%%%%%%%%%%%%% adding port as voltage source %%%%%%%%%%%%%%%%%%%%%%%%
    %modified_edges_for_network_02 = [modified_edges_for_network_02; common_nodes_index(1) common_nodes_index(2)];
    for i = 1:(length(common_nodes_index)-1)
        modified_edges_for_network_02 = [modified_edges_for_network_02; common_nodes_index(i) common_nodes_index(i+1)];
    end

end
