function multiport_decomp_ports(cktnetlist)
    common_nodes =  multiport_decomp_common_nodes(cktnetlist);
    partition_simple = multiport_decomp_partition_simple(cktnetlist);
    number_of_ports = length(unique(partition_simple));
    number_of_rows_of_incidence_matrix_of_ports = length(find(common_nodes));

end
