function modified_edges_for_network_01_g2 = multiport_decomp_network_01_edges_for_G2(cktnetlist)
% -------------------------------------------------------------------------------
% Syntax : modified_edges_for_network_01_g2 = multiport_decomp_network_01_edges_for_G2(cktnetlist)
% -------------------------------------------------------------------------------

    [edgeId_of_tree_of_network_01_g1] = multiport_decomp_dfs_search_of_network_01_g1(cktnetlist);
    modified_edges_for_network_01 = multiport_decomp_network_01(cktnetlist);
    super_node_for_network_01_g2 = [];
    for edge = edgeId_of_tree_of_network_01_g1
        super_node_for_network_01_g2 = [super_node_for_network_01_g2, modified_edges_for_network_01(edge, :)];
    end
    super_node_for_network_01_g2 = unique(super_node_for_network_01_g2);
    modified_edges_for_network_01_g2 = [];
    for i = 1:size(modified_edges_for_network_01,1)
        edge = modified_edges_for_network_01(i,:);
        node1 = edge(1,1);
        node2 = edge(1,2);
        if ismember(node1, super_node_for_network_01_g2) 
            node1 = super_node_for_network_01_g2(1);
        end
        if ismember(node2, super_node_for_network_01_g2) 
            node2 = super_node_for_network_01_g2(1);
        end
        modified_edges_for_network_01_g2 = [modified_edges_for_network_01_g2; node1 node2];
    end 


end
