function cktnetlist_network_01 = multiport_decomp_network_01_mna(cktnetlist)
    partition_simple = multiport_decomp_partition_simple(cktnetlist);
    cktnetlist_network_01.cktname = 'network_01';
    for i = 1:length(partition_simple)
        if ( partition_simple(i) == 1) 


        end

end
