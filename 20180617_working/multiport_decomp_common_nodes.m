function common_nodes =  multiport_decomp_common_nodes(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : common_nodes = multiport_decomp_common_nodes(cktnetlist)
%
% This function return common nodes b/w multiport_simple_partition_A_and_B.
% --------------------------------------------------------------------------------

% ----------------------------- written on : May 25, 2018 ------------------------

  nodes_of_A = multiport_decomp_dfs_search_of_G_dot_A(cktnetlist);
  nodes_of_B = multiport_decomp_dfs_search_of_G_dot_B(cktnetlist);
  common_nodes = nodes_of_B.* nodes_of_A;
end

