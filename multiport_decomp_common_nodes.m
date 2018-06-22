function common_nodes =  multiport_decomp_common_nodes(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : common_nodes = multiport_decomp_common_nodes(cktnetlist)
%
% This function return common nodes b/w multiport_simple_partition_A_and_B.
% --------------------------------------------------------------------------------

% ----------------------------- written on : May 25, 2018 ------------------------

    nodes_of_A = multiport_decomp_dfs_search_of_G_dot_A(cktnetlist);
    nodes_of_B = multiport_decomp_dfs_search_of_G_dot_B(cktnetlist);
   % common_nodes = nodes_of_B.* nodes_of_A;
  %%%% for ckt-04 %%%%%%%
   nodes_of_C = multiport_decomp_dfs_search_of_G_dot_C(cktnetlist);
   common_nodes1 = nodes_of_B .* nodes_of_A; % AB
   common_nodes2 = nodes_of_A .* nodes_of_C; % AC
   common_nodes3 = nodes_of_B .* nodes_of_C; % BC
   common_nodes = common_nodes1 + common_nodes2 + common_nodes3;
end

