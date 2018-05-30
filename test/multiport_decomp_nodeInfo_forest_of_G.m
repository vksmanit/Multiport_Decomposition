function [edges,g1_of_forest,g1] = multiport_decomp_nodeInfo_forest_of_G(cktnetlist);
% Syntax : [edges,g1_of_forest,g1] = multiport_decomp_nodeInfo_forest_of_G(cktnetlist);

% --------------------- written on : May 29, 2017 --------------------------------
 
[nodeVisited,edgeId_of_tree_of_G,dfs_nodes_of_A,dfs_nodes_of_B]= multiport_decomp_modified_dfs_search_of_G_02(cktnetlist);
[edges, g1] = multiport_decomp_nodeInfo_with_edge_identity(cktnetlist);

    global  edges_of_forest;
    N = length(cktnetlist.nodenames)+1;
    g1_of_forest = cell(N,1);

    for i = (edgeId_of_tree_of_G)
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
        g1_of_forest{node1} = [g1_of_forest{node1}, i];
        g1_of_forest{node2} = [g1_of_forest{node2}, i];
    end
end
