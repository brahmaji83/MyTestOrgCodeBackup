trigger SumofAllOpporutnities on Opportunity (after update, after insert) {
    public decimal sum = 0;
    List<Account> acc = new List<Account>();
    Set<Id> acset = new Set<Id>();
    List<Opportunity> op = new List<Opportunity>();
    for(Opportunity o:Trigger.New){
        op.add(o);
        acset.add(o.accountid);
    }
    
    List<Account> aclist  = [select id, name, SumOfOpp__c , (select id, amount from Opportunities) 
                             from account where id in : acset];    
    
    for(Account a:aclist){
        for(Opportunity ops:a.Opportunities){
            sum = sum + ops.amount;
            system.debug('Sum of opp'+sum);
        }
        
        a.SumOfOpp__c = sum;
        system.debug('Sum of opp acc'+sum);
        acc.add(a);        
    }
    update acc;
}