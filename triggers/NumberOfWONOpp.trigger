trigger NumberOfWONOpp on Opportunity (after insert, after update, after delete, after undelete) {   
    
    Set<Id> accId = new Set<Id>();
    
    for(Opportunity o :Trigger.New){
        accId.add(o.AccountId);
    }
    
    List<Account> acc = [select id,  (select id, name from Opportunities where StageName='Closed Won') from Account];
    List<Account> WonOpp = new List<Account>();
    for(Account a : acc){
        a.Number_Of_Won_Opp__c = a.Opportunities.size();
        WonOpp.add(a);
    }
	update WonOpp;
}