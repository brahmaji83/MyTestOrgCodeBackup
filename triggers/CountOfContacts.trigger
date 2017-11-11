trigger CountOfContacts on Contact (after insert) {
    
    Set<Id> accid = new Set<Id>();
    for(Contact c:Trigger.New){
        accid.add(c.AccountId);
    }
    
    List<Account> acc = new List<Account>();
    for(Account a : [select id, (select id from contacts) from Account where id in: accid]){       
        a.Create_Contacts__c = a.contacts.size();
        acc.add(a);
    }
    
    update acc;
}