function [nodeVisited,edgeId_of_tree_of_G,dfs_nodes_of_A,dfs_nodes_of_B]=  multiport_decomp_dfs_search_of_G(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax :  [nodeVisited,edgeId_of_tree_of_G,dfs_nodes_of_A,dfs_nodes_of_B]= multiport_decomp_dfs_search_of_G(cktnetlist)
% --------------------------------------------------------------------------------

% -------------------------- written on : May 31, 2018 ---------------------------
    
    global g1_of_B;
    global nodeVisited;
    global edges;
    global edgeId_of_tree_of_G;
    global dfs_nodes_of_B;
    dfs_nodes_of_B = [];
    [edges ,g1_of_B] = multiport_decomp_nodeInfo_with_edge_identity_of_B(cktnetlist);
    %nodeVisited = zeros(length(g1_of_B),1);
    [nodeVisited,edgeId_of_tree_of_G,dfs_nodes_of_A]= multiport_decomp_dfs_search_of_G_dot_A(cktnetlist); % this will first do ddfs on A-part and then we will extend it to part B
    %fprintf('------------------------------------------------\n');
    %fprintf('------------End of search in part A-------------\n');
    %fprintf('------------------------------------------------\n');
%    pause(1)
    multiport_decomp_start_node_of_G(cktnetlist);
end 

function  multiport_decomp_start_node_of_G(cktnetlist)
    global g1_of_B;
    global nodeVisited;
    global edges;
    global edgeId_of_tree_of_G;
    global dfs_nodes_of_B;
    for i = 1:length(g1_of_B)
        if(nodeVisited(i)==0 )%&& ~isempty(g1_of_B{i}))
                start_node = i;
                multiport_decomp_dfs_search(start_node);
        end
    end
end 

function multiport_decomp_dfs_search(nodeId)

    global g1_of_B;
    global edges;
    global nodeVisited;
    global edgeId_of_tree_of_G;
    global dfs_nodes_of_B;
    if (~isempty(g1_of_B{nodeId}))
        nodeVisited(nodeId) = 1;
        if ( isempty(dfs_nodes_of_B))
            dfs_nodes_of_B = [dfs_nodes_of_B,nodeId];
        elseif(nodeId ~= dfs_nodes_of_B(end))
            dfs_nodes_of_B = [dfs_nodes_of_B,nodeId];
        end

    end
    adjEdgeIdsOfCurrentNode = g1_of_B{nodeId};
    for edgeId=adjEdgeIdsOfCurrentNode
        edge = edges(edgeId, :);
        otherNode = edge(1,2);
        if (strcmp(otherNode,'gnd'))
            otherNode = length(nodeVisited);
        else
            otherNode = str2num(cell2mat(edge(1,2)));
        end
        if otherNode == nodeId 
            otherNode = str2num(cell2mat(edge(1,1)));
            if (isempty(otherNode))
                otherNode = length(nodeVisited);
            end
        end
 
        if 1 == nodeVisited(otherNode)
            continue
        end
        if otherNode == length(nodeVisited)
            print_otherNode = 0;
        else
            print_otherNode = otherNode;
        end
           

        dfs_nodes_of_B = [dfs_nodes_of_B,otherNode];

        edgeId_of_tree_of_G = [ edgeId_of_tree_of_G, edgeId];
        %fprintf ('visiting node [%d] from [%d] using edgeId [%d]\n', print_otherNode, nodeId, edgeId);
        multiport_decomp_dfs_search (otherNode);
    end
end


