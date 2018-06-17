function v_nP = multiport_decomp_port_potential(cktnetlist)
% --------------------------------------------------------------------------------
% Syntax : v_nP = multiport_decomp_port_potential(cktnetlist)
% This function will return port node potential vector v_nP. 
% This node potential can be used to calculate potential difference 
% across the port terminals.
% --------------------------------------------------------------------------------
    ArP = multiport_decomp_incidence_matrix_for_port(cktnetlist);
%    incidence_matrix_for_port = incidence_matrix_for_port(1:end-1, :);
    [i_p1, G_p1] =  multiport_decomp_G_and_b_of_network_01(cktnetlist);
    [i_p2, G_p2] =  multiport_decomp_G_and_b_of_network_02(cktnetlist);
    %partition_simple = multiport_decomp_partition_simple(cktnetlist);
    %number_of_ports = length(unique(partition_simple));
   % G = zeros(number_of_ports, number_of_ports);
  %  b = zeros(number_of_ports, 1);
    G = blkdiag(G_p1, G_p2);
    b = [i_p1;i_p2];

    %%%%%%%%%%%%%% G and b of Multiports is written here %%%%%%%%%%%%%%
   %G(1,1) = G_p1; b(1) = i_p1;
   %G(2,2) = G_p2; b(2) = i_p2;
    v_nP = (ArP * G * ArP')\(-ArP * b);


end


