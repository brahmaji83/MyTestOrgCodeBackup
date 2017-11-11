trigger SumOfOppAmount on Opportunity (after insert, after update) {
    
    public Set<Id> accId = new Set<Id>();
 //   public decimal oppamount;
    for(Opportunity o:Trigger.new){
        accId.add(o.AccountId);
    }
    
    List<Account> accList = [select Id, name, (select Amount, Id from Opportunities) from Account where id in:accId];
    List<Account> accListUpd = new List<Account>();
    for(Account a : accList){
        decimal oppamount = 0;
        for(Opportunity o: a.Opportunities){            
            oppamount = oppamount + o.Amount;            
        }
        a.Sum_Of_Opportunites__c = oppamount;
        accListUpd.add(a);
    }
    
    update accListUpd;

}