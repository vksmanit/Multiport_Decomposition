function [edges, g1_of_C] = multiport_decomp_nodeInfo_with_edge_identity_of_C(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : [edges, g1_of_C] = multiport_decomp_nodeInfo_with_edge_identity_of_C(cktnetlist)
%
% This will return a cell object g1_of_C which is a column vector having information 
% that each row represent the node number and entry to each row corresponds to the% edge identity of graph of G.C.
% --------------------------------------------------------------------------------

% ----------------------------- written on : May 27, 2018 ------------------------
    global g1_of_C;
    global edges;
    edges = {};
    
    N = length(cktnetlist.nodenames)+ 1;  %% '+1' is for gnd node 
    %%%%% partition_simple can be done in more general way or harcoded; %%%%
    partiion_simple = multiport_decomp_partition_simple(cktnetlist);

       
    g1_of_C = cell(N,1);
    for i = 1:length(cktnetlist.elements)
        edges = [edges ; cktnetlist.elements{i}.nodes];
        if (partiion_simple(i) == 2) %% this will allow the elements belonging to the only C-type 
            edge = cktnetlist.elements{i}.nodes;
            node1 = edge(1,1);
            node2 = edge(1,2);
            % chage 'gnd' node name to the '0' and convert other nodes to mat-typefrom cell type 
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
                g1_of_C{node1} = [g1_of_C{node1}, i];
                g1_of_C{node2} = [g1_of_C{node2}, i];
        end
    end
end

