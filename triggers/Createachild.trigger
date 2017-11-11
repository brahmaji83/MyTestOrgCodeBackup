trigger Createachild on Account (after insert) {
    
    if(Overcomerecursive.runonce())
    {
        Account a = new account();
        system.debug('entered');
        a.name = 'recursive';
        insert a;
        
        Contact c = new Contact();
        system.debug('create contact');
        c.LastName = a.name;
        c.AccountId = a.Id;
        insert c;
    }    
}