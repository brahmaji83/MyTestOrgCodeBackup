trigger ContactToAccountUp on Contact (after insert, after update) {
    Map<Id, String> conStatus = new Map<Id, String>();
    Set<Id> accId = new Set<Id>();
    Set<Account> accSuc = new Set<Account>();
    Set<Account> accFail = new Set<Account>();
    Set<Id> conSuc = new Set<Id>();
    Set<Id> conFail = new Set<Id>();
    for(Contact c: Trigger.new){
        accId.add(c.AccountId);
    //    conStatus.put(c.Id, c.Status__c);
    }
    
    List<Contact> conList = [select Status__c, AccountId from Contact where accountId in:accId];
    
    for(Contact c: conList){
        conStatus.put(c.Id, c.Status__c);        
    }
    List<Account> accList = [select Id, ContactStatus__c, (select Id,Status__c from contacts) 
                            from Account where id in: accId];
    for(Account a : accList){        
        for(Contact c: a.contacts){
            if(c.Status__c == 'Fail')
            {
                a.ContactStatus__c = 'Fail';
                system.debug('eneted fail');
                accFail.add(a);
                break;
            }                
        }      
    }
    
    for(Account a: accList){
        if(!!conFail.contains(a.Id)){
            a.ContactStatus__c='Success';
            system.debug('entered success');               
            accSuc.add(a);
        }
    }
    List<Account> accSucList = new List<Account>();
    accSucList.addAll(accSuc);
    List<Account> accFailList = new List<Account>();
    accFailList.addAll(accFail);
    update accFailList;
    update accSucList;
    
    Map<Id, String> cdata = new Map<Id, String>();
    
    if(Trigger.isAfter && Trigger.isInsert)
    for(Contact c: Trigger.new){
        cdata.put(c.accountId, c.Update__c);
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        for(Contact c: Trigger.new){
            for(Contact cold: Trigger.Old){
                if(c.Update__c <> cold.Update__c)
                    cdata.put(c.accountId, c.Update__c);    
            }               
        }
    }
    List<Account> acc = new List<Account>();
    for(Account a: [select Id, Contact_Update_Comment__c from Account where id in: cdata.keySet()]){
        a.Contact_Update_Comment__c = cdata.get(a.Id);
        acc.add(a);
    }
    
    if(acc.size()>0){
        update acc;        
    }   
  
}