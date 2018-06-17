function [i_p2, G_p2] =  multiport_decomp_G_and_b_of_network_02(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax: [i_p2, G_p2] =  multiport_decomp_G_and_b_of_network_02(cktnetlist)
% --------------------------------------------------------------------------------


    [G_n2, J_n2] = multiport_decomp_G_and_J_of_network_02(cktnetlist);
    [A1g_n2, A2g_n2, A2e_n2] = multiport_decomp_incidence_matrix_for_network_02(cktnetlist);
    
    M = A1g_n2 * G_n2 * A1g_n2';
    v_n2 = M\(-A1g_n2 * G_n2 * A2g_n2' * inv(A2e_n2'));
    G_p2 = A2e_n2 \ (-A2g_n2 * G_n2 *(A1g_n2' * v_n2 + A2g_n2' * inv(A2e_n2')));
    %%%% for short ckt current %%%
    v_n2 = M\(-A1g_n2 * J_n2);
    i_p2 = A2e_n2 \ (-A2g_n2 * G_n2 * A1g_n2' * v_n2 - A2g_n2 *  J_n2); 
end
