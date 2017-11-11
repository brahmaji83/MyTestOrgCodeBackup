trigger WhenAccUpdthenUpdContact on Account (after update) {
    Map<Id, Account> mapacc = new Map<Id, Account>();
    for(integer i=0; i< Trigger.old.size();i++){
        if(Trigger.old[i].Update__c != Trigger.New[i].Update__c) {
            mapacc.put(Trigger.New[i].Id, Trigger.New[i]);
        }
    }
    List<Contact> conList = new List<Contact>();
    for(Contact c: [select Id, Account_Update__c, AccountId from contact where accountId in: mapacc.keySet()]){
        Account acc = mapacc.get(c.AccountId);
        c.Account_Update__c = acc.Update__c;        
        conList.add(c);
    }
    if(!conList.isEmpty())
        update conList;
}