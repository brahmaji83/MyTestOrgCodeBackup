trigger primarycheck on Contact (before insert, before update ) {
    
/*  if((Trigger.isInsert || Trigger.isUpdate) && (Trigger.isAfter || Trigger.isBefore))
    {
        Set<Id> accId = new Set<Id>();  
        for(Contact c: Trigger.new){
            if(c.Primary__c == true){
                accId.add(c.accountId);
            }
        }
        
        List<Account> accList = [select id, (select id,Primary__c from contacts) from Account where id in: accId];
        system.debug(accList);                           
        List<Contact> conListUpd = new List<Contact>();    
        for(Account a : accList){
            for(contact c : a.contacts){
                system.debug('entered insite for loop'+c.Id+c.Primary__c);
                if(c.Primary__c == true){
                    c.Primary__c = false;
                    conListUpd.add(c);
                }
            }
        }
        
        if(conListUpd.size()>0){
            update conListUpd;
        }
    }       
*/
    if((Trigger.isInsert || Trigger.isUpdate) && (Trigger.isBefore)){
        ContactHandler.beforetrigger(Trigger.New);      
    }
}