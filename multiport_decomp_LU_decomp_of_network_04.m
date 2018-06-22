function [L,U] = multiport_decomp_LU_decomp_of_network_04(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : [L_n4, U_n4] = multiport_decomp_LU_decomp_of_network_04(cktnetlist) 
% --------------------------------------------------------------------------------
    incidence_matrix_of_network_04_g1 = multiport_decomp_incidence_matrix_for_network_04_g1(cktnetlist);
    A1g_n4 = incidence_matrix_of_network_04_g1(1:end-1,:);
    [G_n4, J_n4] = multiport_decomp_G_and_J_of_network_04(cktnetlist);
    coeff_matrix = A1g_n4 * G_n4 * A1g_n4';
    [L,U] = lu_decom(coeff_matrix);
end
