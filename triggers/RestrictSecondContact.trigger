trigger RestrictSecondContact on Contact (before insert) {
    Set<Id> accId = new Set<Id>();
    
    for(Contact c: Trigger.New){
        accId.add(c.AccountId);
    }
    
    Map<Id, Integer> accMap = new Map<Id, Integer>();
    List<Account> accList = [select id, (select id from contacts) from Account
                            where id in : accId];
    
    for(Account a: accList){
        accMap.put(a.Id, a.contacts.size());
        system.debug('account id'+accMap.get(a.Id) );
    }
    
    for(contact con: [select id, AccountId from contact where accountId in : accMap.keySet()]){
        if(accMap.get(con.AccountId)>1){            
            Trigger.New[0].addError('Already a contact exist');
        }
    }

}