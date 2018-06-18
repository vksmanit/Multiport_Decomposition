function modified_edges_for_network_02_g1 = multiport_decomp_network_02_edges_for_G1(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax :  modified_edges_for_network_02_g1 = multiport_decomp_network_02_edges_for_G1(cktnetlist) 
% --------------------------------------------------------------------------------

     modified_edges_for_network_02 = multiport_decomp_network_02(cktnetlist);
     common_nodes = multiport_decomp_common_nodes(cktnetlist);
     common_nodes_index = find(common_nodes);
     partition_simple = multiport_decomp_partition_simple(cktnetlist);
     nodes_to_be_mergers_for_g1 = modified_edges_for_network_02(end:-1:end - length(common_nodes_index) + 2, :);
     nodes_to_be_mergers_for_g1 = unique(nodes_to_be_mergers_for_g1);
     %nodes_to_be_mergers_for_g1 = modified_edges_for_network_02(end,:);
     modified_edges_for_network_02_g1 = [];
     N = length(cktnetlist.nodenames)+1;
     for i = 1:length(cktnetlist.elements)
         if (partition_simple(i) == 1) 
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
             if ismember(node1, nodes_to_be_mergers_for_g1) 
                 node1 = nodes_to_be_mergers_for_g1(1);
             end
             if ismember(node2, nodes_to_be_mergers_for_g1) 
                 node2 = nodes_to_be_mergers_for_g1(1);
             end
             modified_edges_for_network_02_g1 = [modified_edges_for_network_02_g1; node1 node2];
         end 
     end
            

end
