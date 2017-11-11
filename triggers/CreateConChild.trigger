trigger CreateConChild on Contact (after insert) {

    if(Overcomerecursive.runonce()){
        Contact c = new Contact();
        system.debug('create contact');
        c.LastName = 'brahma';
//        c.AccountId = a.Id;
        insert c;
    }
}