function incidence_matrix_of_network_04_g2 = multiport_decomp_incidence_matrix_for_network_04_g2(cktnetlist) 
% --------------------------------------------------------------------------------
% Syntax : incidence_matrix_of_network_04_g2 = multiport_decomp_incidence_matrix_for_network_04_g2(cktnetlist)
% --------------------------------------------------------------------------------


    modified_edges_for_network_04_g2 = multiport_decomp_network_04_edges_for_G2(cktnetlist);
    rows = length(unique(modified_edges_for_network_04_g2));
    cols = size(modified_edges_for_network_04_g2,1);
    incidence_matrix_of_network_04_g2 = zeros(rows,cols);
    for i = 1:cols 
        if (modified_edges_for_network_04_g2(i,1) ~= modified_edges_for_network_04_g2(i,2))
            incidence_matrix_of_network_04_g2(modified_edges_for_network_04_g2(i,1), i) = +1;
            incidence_matrix_of_network_04_g2(modified_edges_for_network_04_g2(i,2), i) = -1;
        end
    end
    incidence_matrix_of_network_04_g2 = incidence_matrix_of_network_04_g2(unique(modified_edges_for_network_04_g2),:);
end
