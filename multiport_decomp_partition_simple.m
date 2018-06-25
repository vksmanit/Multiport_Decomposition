function partition_simple = multiport_decomp_partition_simple(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : partition_simple = multiport_decomp_partition_simple(cktnetlist)
% 
% This function return the partition of network;
% This is very simple hardcoded partition.
% --------------------------------------------------------------------------------

% -------------------------------- written on : May 23, 2018 ---------------------
    
   number_of_element = length(cktnetlist.elements);
   %%%%% partition_simple can be patition in more general or can be hardcoded %%%%%
    %%%% ckt-04 %%%%% 
    % partition_simple =  [0 0 0 0 0 1 1 1 1 1 1 1]; % for ckt-01
    %partition_simple =  [0 0 0 0 0 1 1 1 1 1 1 1 1]; % for ckt-03
   % partition_simple =  [0 0 0 0 0 0 0 0 0 1 1 1 1 2 2 2 2]; % for ckt-04
    partition_simple =  [0 0 0 0 0 0 0 0 0 1 1 1 1 2 2 2 2 3 3 3 3]; % for ckt-05
    

  %  partition_simple = zeros(1,number_of_element);
  % for i = 1 : number_of_element 
    
  %      if (strcmp(cktnetlist.elements{i}.name(1), 'I')) %compare it if it is I-source
  %          partition_simple(i) = 1;
  %      end
    
  %      if (strcmp(cktnetlist.elements{i}.name(1), 'R')) 
  %          if (cell2mat(cktnetlist.elements{i}.parms) == 1000)
  %              partition_simple(i) = 1;
  %          end 
  %     end 
  %end 
end 
