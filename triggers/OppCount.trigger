trigger OppCount on Opportunity (after insert, after update) {
    
    
    Set<ID> accId = new Set<Id>();
    
    for(Opportunity o:Trigger.New){
        accId.add(o.accountid);
    }
    
    List<Account> accList = [select id, name, (select id from Opportunities) from Account where id in: accId];    
    List<Account> updaccList = new List<Account>();
    
    for(Account a :accList){
        a.Count_of_Opportunities__c = a.Opportunities.size();
        updaccList.add(a);
    }
    
    update updaccList;
}