function incidence_matrix_of_network_01_g1 =  multiport_decomp_incidence_matrix_for_network_01_g1(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : incidence_matrix_of_network_01_g1 = multiport_decomp_incidence_matrix_for_network_01_g1(cktnetlist)
% --------------------------------------------------------------------------------
     modified_edges_for_network_01_g1 = multiport_decomp_network_01_edges_for_G1(cktnetlist);
     rows = length(unique(modified_edges_for_network_01_g1));
     cols = size(modified_edges_for_network_01_g1,1);
     incidence_matrix_of_network_01_g1 = zeros(rows,cols);
     for i = 1:cols
         incidence_matrix_of_network_01_g1(modified_edges_for_network_01_g1(i,1),i) = +1 ;
         incidence_matrix_of_network_01_g1(modified_edges_for_network_01_g1(i,2),i) = -1 ;
     end
     incidence_matrix_of_network_01_g1 = incidence_matrix_of_network_01_g1(unique(modified_edges_for_network_01_g1),:);
end
