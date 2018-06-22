function [G_n4, J_n4]=  multiport_decomp_G_and_J_of_network_04(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : [G_n4, J_n4] = multiport_decomp_G_and_J_of_network_04(cktnetlist)
% --------------------------------------------------------------------------------
    %%%%% partition_simple can be patition in more general or can be hardcoded %%%%%
    partition_simple = multiport_decomp_partition_simple(cktnetlist);
    size_of_G = 0 ;
    for i = (partition_simple)
        if (i == 0) 
            size_of_G = size_of_G + 1;
        end
    end
    %size_of_G = length(find(partition_simple));
    G_n4 = zeros(size_of_G, size_of_G);
    J_n4 = zeros(size_of_G, 1);
    index = 1;
    for i = 1: length(cktnetlist.elements)
        if (partition_simple(i) == 3)
            if (~isempty(cktnetlist.elements{i}.parms))
                resistance = cell2mat(cktnetlist.elements{i}.parms);
                G_n4(index,index) = 1/resistance;
                J_n4(index) = 0;
            else 
                G_n4(index,index) = 0;
                J_n4(index) = (cktnetlist.elements{i}.udata{1}.QSSval);
            end
            index = index + 1;
        end
    end


end
