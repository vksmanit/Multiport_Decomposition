function cktnetlist = ckt_test()
    clear cktnetlist;
    cktnetlist.cktname = 'test';
    cktnetlist.nodenames = {'1','2','3'};
    cktnetlist.groundnodename = 'gnd';
    rM = resModSpec();
    iM = isrcModSpec();
    vM = vsrcModSpec();
    % ------------------------------- A-PART --------------------------------
    cktnetlist = add_element(cktnetlist, iM, 'I1', {'1','2'}, {}, {{'DC', 0.01}});
    cktnetlist = add_element(cktnetlist, rM, 'R2', {'1','3'}, {{'R', 1000}});
    cktnetlist = add_element(cktnetlist, rM, 'R3', {'2','3'}, {{'R', 1000}});

end
