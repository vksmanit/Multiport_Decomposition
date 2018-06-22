function working_chache(cktnetlist)
    [nodeVisited,edgeId_of_tree_of_G,dfs_nodes_of_A,dfs_nodes_of_B]= multiport_decomp_dfs_search_of_G(cktnetlist);

    modified_edge_for_multiport_network_01_port = [];
    modified_edge_for_multiport_network_02_port = [];
    aggregate_node_for_network_01 = [];
    aggregate_node_for_network_02 = [];


    [treeEdgeId_of_A_01, treeEdgeId_of_B_01, treeEdgeId_of_A_02, treeEdgeId_of_B_02]= multiport_decomp_tree_partition_01(cktnetlist);

    super_node1 = {dfs_nodes_of_B};
    
    for edgeId = treeEdgeId_of_B_01 
        nodeId = cktnetlist.elements{edgeId}.nodes;
        start_node = nodeId(1);
        end_node = nodeId(2);
        if (strcmp(start_node, 'gnd'))
            start_node = length(nodeVisited);
        else
            start_node = str2num(cell2mat(start_node));
        end
        if (strcmp(end_node,'gnd'))
            end_node = length(nodeVisited);
        else
            end_node = str2num(cell2mat(end_node));
        end
        if (isempty(find(start_node == dfs_nodes_of_B)))
            super_node1{1} = [super_node1{1}, start_node];
        elseif (isempty(find(end_node == dfs_nodes_of_B)))
            super_node1{1} = [super_node1{1}, end_node ];
        else 
            super_node1 = super_node1;
        end
    end

    super_node2 = {dfs_nodes_of_A};
    
    for edgeId = treeEdgeId_of_A_02 
        nodeId = cktnetlist.elements{edgeId}.nodes;
        start_node = nodeId(1);
        end_node = nodeId(2);
        if (strcmp(start_node, 'gnd'))
            start_node = length(nodeVisited);
        else
            start_node = str2num(cell2mat(start_node));
        end
        if (strcmp(end_node,'gnd'))
            end_node = length(nodeVisited);
        else
            end_node = str2num(cell2mat(end_node));
        end
        if (isempty(find(start_node == dfs_nodes_of_A)))
            super_node2{1} = [super_node2{1}, start_node];
        elseif (isempty(find(end_node == dfs_nodes_of_A)))
            super_node2{1} = [super_node2{1}, end_node ];
        else 
            super_node2 = super_node2;
        end
    end

end
