function [edges,g1_of_supernode] =  multiport_decomp_nodeInfo_of_edge_identity_of_supernode_of_G(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : [edges,g1_of_supernode] =  multiport_decomp_nodeInfo_of_edge_identity_of_supernode_of_G(cktnetlist)

% -------------------------------- Written on : May 29, 2018 ---------------------

    global g1_of_supernode;
    global edges;
    super_node  =  multiport_decomp_super_node_of_forest_of_G_02(cktnetlist);
    N = length(super_node);
    g1_of_supernode = cell(N,1);
    for i = 1: length(cktnetlist.elements)
        edges = [edges;cktnetlist.elements{i}.nodes];
        edge = cktnetlist.elements{i}.nodes;
        node1 = edge(1,1);
        node2 = edge(1,2);
        % chage 'gnd' node name to the '0' and convert other nodes to mat-typefrom cell type 
        if (strcmp(node1,'gnd'))
            node1 = length(cktnetlist.nodenames)+ 1;
        else 
            node1 = str2num(cell2mat(node1));
        end
        if (strcmp(node2,'gnd'))
            node2 = length(cktnetlist.nodenames)+ 1;
        else 
            node2 = str2num(cell2mat(node2));
        end
        for j = 1:N
            if(~isempty(find(super_node{j} == node1))) % node1 is in super_node
                if(isempty(find(super_node{j} == node2))) % node2 is not is super_node
                    g1_of_supernode{j} = [g1_of_supernode{j},i];
                end
            elseif(~isempty(find(super_node{j} == node2))) % node2 is in super_node
                if(isempty(find(super_node{j} == node1))) % node1 is not is super_node
                    g1_of_supernode{j} = [g1_of_supernode{j},i];
                end
            end
        end
       % edges = unique(edges);
end
