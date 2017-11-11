trigger ContactToAccountUp2 on Contact (after update) {
    Map<Id, String> conup = new Map<Id, String>();
    
    for(Contact cnew: Trigger.New){
        for(contact cold:Trigger.Old){
            if(cnew.Update__c <> cold.Update__c){
                conup.put(cnew.AccountId, cnew.Update__c);
            }
        }
    }
    
    List<Account> accList = [select id, Name, Contact_Update_Comment__c from Account where id in: conup.keySet()];
    List<Account> accUpd = new List<Account>();
    for(Account a: accList){
        a.Contact_Update_Comment__c = conup.get(a.Id);
        accUpd.add(a);
    }
	update accupd;
}