function [edgeId_of_tree_of_G, super_node_edgeIds]  = multiport_decomp_tree_of_A_extended_to_B(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : [edgeId_of_tree_for_hybrid_analysis, super_node_edgeIds] = multiport_decomp_tree_of_A_extended_to_B(cktnetlist)
% --------------------------------------------------------------------------------

% ------------------------------ written on : May 29, 2018 -----------------------

    
    global g1_of_supernode;
    global super_node_visited;
    global graph_of_super_node;
%    global nodeVisited;
    global edgeId_of_tree_of_G;
    global super_node_edgeIds;
    super_node_edgeIds = [];

    [nodeVisited,edgeId_of_tree_of_G,dfs_nodes_of_A,dfs_nodes_of_B] = multiport_decomp_modified_dfs_search_of_G_01(cktnetlist);
    graph_of_super_node =  multiport_decomp_graph_info_of_super_node(cktnetlist);
    [edges, g1_of_supernode] = multiport_decomp_nodeInfo_with_edge_identity_of_super_node_of_G(cktnetlist);
    super_node_visited = zeros(length(g1_of_supernode),1);
    %fprintf('-------------------------------------------------------\n');
    %fprintf('------------ starting search in supernode -------------\n');
    %fprintf('-------------------------------------------------------\n');
    multiport_decomp_dfs_search(1);
end

function multiport_decomp_dfs_search(superNodeId)
    global g1_of_supernode;
    global super_node_visited;
    global super_node_edgeIds;
    global graph_of_super_node;
    global edgeId_of_tree_of_G;
    super_node_visited(superNodeId) = 1;
    adjEdgeIdsOfCurrentNode = g1_of_supernode{superNodeId};
    for edgeId=adjEdgeIdsOfCurrentNode
        edge = graph_of_super_node{edgeId};
        otherSuperNode = edge(1,2);
        if otherSuperNode == superNodeId 
            otherSuperNode = edge(1,1);
        end
        if super_node_visited(otherSuperNode) == 1
            continue
        end
        super_node_edgeIds = [super_node_edgeIds, edgeId];
        edgeId_of_tree_of_G = [edgeId_of_tree_of_G,edgeId];
        multiport_decomp_dfs_search (otherSuperNode);
    end
end
