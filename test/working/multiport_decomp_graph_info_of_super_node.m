function graph_of_super_node=  multiport_decomp_graph_info_of_super_node(cktnetlist)
% -------------------------------------------------------------------------
% Syntax : graph_of_super_node = multiport_decomp_graph_info_of_super_node(cktnetlist)
% -------------------------------------------------------------------------

% ------------------------- written on : May 29, 2017 ---------------------
    
    graph_of_super_node = cell(length(cktnetlist.elements),1);
    supernode =  multiport_decomp_super_node_of_forest_of_G_02(cktnetlist);
    [edges, g1_of_supernode] = multiport_decomp_nodeInfo_of_edge_identity_of_supernode_of_G_02(cktnetlist);
    for i = 1:length(cktnetlist.elements)
        for j = 1:length(supernode)
            if (~isempty(find(g1_of_supernode{j} == i)))
                graph_of_super_node{i} = [graph_of_super_node{i},j];
            end
        end
    end
end


