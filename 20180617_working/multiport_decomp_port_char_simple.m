function multiport_decomp_port_char_simple(cktnetlist)
%
%  % [nodeVisited_A,edgeId_of_tree_of_A,dfs_nodes_of_A] = multiport_decomp_dfs_search_of_G_dot_A(cktnetlist);
%   %[nodeVisited_B,edgeId_of_tree_of_B,dfs_nodes_of_B] = multiport_decomp_dfs_search_of_G_dot_B(cktnetlist);
%   port_edges = [edgeId_of_tree_of_A, edgeId_of_tree_of_B];
%   partition_simple = multiport_decomp_partition_simple(cktnetlist);
%   common_nodes = multiport_decomp_common_nodes(cktnetlist);
%   multiport_network_01_port = [];
%   multiport_network_02_port = [];
%   [edgeId_of_tree_of_A_to_B, super_node_edgeIds_01] = multiport_decomp_tree_of_A_extended_to_B(cktnetlist);
%   [edgeId_of_tree_of_B_to_A, super_node_edgeIds_02] = multiport_decomp_tree_of_B_extended_to_A(cktnetlist);
%   
%   % This for loop will give the port branch for MP1
%   for edge = edgeId_of_tree_of_B 
%       if (~ismember(edge,find(partition_simple))) % edge is member of B 
%           if (~ismember(edge,edgeId_of_tree_of_A_to_B)) % and edge is not member of tree of edge id of G.B
%               multiport_network_01_port = edge;
%           end 
%       end
%   end
%
%   % This for loop will give the port branch for MP2
%   for edge = edgeId_of_tree_of_A
%       if (ismember(edge,find(partition_simple))) % edge is member of A 
%           if (~ismember(edge,edgeId_of_tree_of_B_to_A)) % and edge is not member of tree of edge id of G.A
%               multiport_network_02_port = edge;
%           end 
%       end
%   end
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


















































    %[nodeVisited,edgeId_of_tree_of_A_to_B,dfs_nodes_of_A1,dfs_nodes_of_B1] = multiport_decomp_modified_dfs_search_of_G_01(cktnetlist);
    %[nodeVisited,edgeId_of_tree_of_B_to_A,dfs_nodes_of_B1,dfs_nodes_of_A1] = multiport_decomp_modified_dfs_search_of_G_02(cktnetlist);

%   super_node1 = multiport_decomp_super_node_of_forest_of_G(cktnetlist);
%   super_node2 = multiport_decomp_super_node_of_forest_of_G_02(cktnetlist);
%   nodes_for_super_node_edgeIds_01 = [];
%   nodes_for_super_node_edgeIds_02 = [];
%   
%   % this loop is for disconnected A and B part
%   for edge = super_node_edgeIds_01 
%       nodeId = cktnetlist.elements{edge}.nodes;
%       start_node = nodeId(1);
%       end_node = nodeId(2);
%       if (strcmp(start_node, 'gnd'))
%           start_node = length(nodeVisited);
%       else
%           start_node = str2num(cell2mat(start_node));
%       end
%       if (strcmp(end_node,'gnd'))
%           end_node = length(nodeVisited);
%       else
%           end_node = str2num(cell2mat(end_node));
%       end
%       nodes_for_super_node_edgeIds_01 = [nodes_for_super_node_edgeIds_01; start_node, end_node];
%   end
%
%   % this loop is for disconnected A and B part
%   for edge = super_node_edgeIds_02 
%       nodeId = cktnetlist.elements{edge}.nodes;
%       start_node = nodeId(1);
%       end_node = nodeId(2);
%       if (strcmp(start_node, 'gnd'))
%           start_node = length(nodeVisited);
%       else
%           start_node = str2num(cell2mat(start_node));
%       end
%       if (strcmp(end_node,'gnd'))
%           end_node = length(nodeVisited);
%       else
%           end_node = str2num(cell2mat(end_node));
%       end
%       nodes_for_super_node_edgeIds_02 = [nodes_for_super_node_edgeIds_02; start_node, end_node];
%   end
%
%   common_nodes_index = find(common_nodes);
%   for j = 1:length(super_node1)
%       for k = 1: length(common_nodes_index)
%           if(~isempty(find(common_nodes_index(k) == super_node1{j}))) % & isempty(find(common_nodes_index(k) == nodes_for_super_node_edgeIds_01)))
%               aggregate_node_for_network_01(j) = common_nodes_index(k);
%               break;
%           end 
%       end 
%   end
%
%   for j = 1:length(super_node2)
%       for k = 1: length(common_nodes_index)
%           if(~isempty(find(common_nodes_index(k) == super_node2{j}))) % & isempty(find(common_nodes_index(k) == nodes_for_super_node_edgeIds_02)))
%               aggregate_node_for_network_02(j) = common_nodes_index(k);
%               break;
%           end 
%       end 
%   end
%
%   for k = 1:size(nodes_for_super_node_edgeIds_01,1)
%       nodes = nodes_for_super_node_edgeIds_01(k,:);
%           node1 = nodes(1);
%           node2 = nodes(2);
%       for j = 1:length(super_node1)
%           if (ismember(node1,super_node1{j}))
%              super_node1{j} = [super_node1{j}, node2];
%           elseif (ismember(node2,super_node1{j}))
%              super_node1{j} = [super_node1{j}, node1]
%           end
%       end
%   end
%
%   for k = 1:size(nodes_for_super_node_edgeIds_02,1)
%       nodes = nodes_for_super_node_edgeIds_02(k,:);
%           node1 = nodes(1);
%           node2 = nodes(2);
%       for j = 1:length(super_node1)
%           if (ismember(node1,super_node2{j}))
%              super_node2{j} = [super_node2{j}, node2];
%           elseif (ismember(node2,super_node2{j}))
%              super_node2{j} = [super_node2{j}, node1]
%           end
%       end
%   end



            




end 
