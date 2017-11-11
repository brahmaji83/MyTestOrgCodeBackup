trigger ContactCount on Contact (after insert, after update) {
	
    list<Contact> con = trigger.isDelete ? trigger.old:trigger.new;
    
    Set<Id> accId = new Set<Id>();
    
    for(Contact c: con){
        accId.add(c.AccountId);
    }
    
    List<Account> accList = [select id, name, (select Id, LastName, Email from Contacts)
                             from Account where id in:accId];
    List<Account> acc = new List<Account>();
    for(Account a : accList){
        a.Number_of_Contacts__c = a.contacts.size();
        acc.add(a);
    }
    update acc;
    
}