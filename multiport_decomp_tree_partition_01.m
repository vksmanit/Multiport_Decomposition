function [treeEdgeId_of_A_01, treeEdgeId_of_B_01, treeEdgeId_of_A_02, treeEdgeId_of_B_02] = multiport_decomp_tree_partition_01(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax :  [treeEdgeId_of_A_01, treeEdgeId_of_B_01, treeEdgeId_of_A_02, treeEdgeId_of_B_02]= multiport_decomp_tree_partition_01(cktnetlist)
% --------------------------------------------------------------------------------

% -------------------------- written on : May 31, 2018 ---------------------------

    [edgeId_of_tree_of_A_to_B, super_node_edgeIds_01] = multiport_decomp_tree_of_A_extended_to_B(cktnetlist);
    [edgeId_of_tree_of_B_to_A, super_node_edgeIds_02] = multiport_decomp_tree_of_B_extended_to_A(cktnetlist);
%    common_nodes = nal_nbk_A_and_B_common_nodes(cktnetlist);
    multiport_decomp_A_and_B_part = multiport_decomp_partition_simple(cktnetlist);
    treeEdgeId_of_A_01 = [];
    treeEdgeId_of_B_01 = [];
    treeEdgeId_of_A_02 = [];
    treeEdgeId_of_B_02 = [];
    for treeEdgeId = edgeId_of_tree_of_A_to_B
        if (multiport_decomp_A_and_B_part(treeEdgeId) == 1)
            treeEdgeId_of_A_01 = [treeEdgeId_of_A_01,treeEdgeId];
        else
            treeEdgeId_of_B_01 = [treeEdgeId_of_B_01,treeEdgeId];
        end
    end
    for treeEdgeId = edgeId_of_tree_of_B_to_A
        if (multiport_decomp_A_and_B_part(treeEdgeId) == 1)
            treeEdgeId_of_A_02 = [treeEdgeId_of_A_02,treeEdgeId];
        else
            treeEdgeId_of_B_02 = [treeEdgeId_of_B_02,treeEdgeId];
        end
    end
end
