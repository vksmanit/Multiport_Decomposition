function partition_simple = multiport_decomp_partition_simple(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : partition_simple = multiport_decomp_partition_simple(cktnetlist)
% 
% This function return partition for simple circuit 'muliport_decomp_ckt_01' 
% here '1' represet 'part_1', '2' represet 'part_2' and '0' represet ports
% --------------------------------------------------------------------------------

% -------------------------------- written on : May 23, 2018 ---------------------
    
   number_of_element = length(cktnetlist.elements);
   partition_simple = zeros(1,number_of_element);
   for i = 1 : number_of_element 

        if (strcmp(cktnetlist.elements{i}.name(1), 'I')) %compare it if it is V-source
            partition_simple(i) = 1;
        end

        if (strcmp(cktnetlist.elements{i}.name(1), 'R')) %compare it if it is V-source
            if (cell2mat(cktnetlist.elements{i}.parms) == 1000)
                partition_simple(i) = 1;
            end 
        end 
   end 
end 
