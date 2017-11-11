trigger UpdateAccountName on Contact (before insert, before update) {
    Set<Id> accIdList = new Set<Id>();
    for(Contact  c: Trigger.New){
        accIdList.add(c.AccountId);
    }
    
    if(accIdList.size()>0){
    
        Map<Id, Account> accMap = new Map<Id, Account>([select Id, Name from Account where id in: accIdList]); 
        
        for(Contact c: Trigger.New){
            c.Account_Name__c = accMap.get(c.AccountId).Name;
        }
    }
}