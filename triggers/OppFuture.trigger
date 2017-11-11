trigger OppFuture on Opportunity (after insert, after update) {
    OppFuture.updatename();
    Account a = new Account(name='test');
    insert a;
    QueuebaleExample qe = new QueuebaleExample();
    id jobid = system.enqueueJob(qe);
    system.debug('job id'+jobid);
}