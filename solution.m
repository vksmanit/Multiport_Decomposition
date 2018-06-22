
global L_n1
global U_n1
cktnetlist = multiport_decomp_ckt_04();
[L_n1, U_n1] = multiport_decomp_LU_decomp_of_network_01(cktnetlist);
 [A1g_n1, A2g_n1, A2e_n1] = multiport_decomp_incidence_matrix_for_network_01(cktnetlist);
 v_nP = multiport_decomp_port_potential(cktnetlist);
 ArP = multiport_decomp_port(cktnetlist);
 ArP = ArP(1:end-1,1:3);
 v_E = ArP'* v_nP;
 v_n2 = A2e_n1' \ v_E;

 [G_n1, J_n1] = multiport_decomp_G_and_J_of_network_01(cktnetlist);

 rhs = -A1g_n1 * J_n1 - A1g_n1  * G_n1 * A2g_n1' * v_n2;
 v_n1  = solution_of_system_using_lu(L_n1,U_n1,rhs);
 vg = A1g_n1' * v_n1 + A2g_n1' * v_n2;
 ig = J_n1 + G_n1 * vg;

