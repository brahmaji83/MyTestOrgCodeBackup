trigger AutoOppCreation on Account (after insert, after update) {
    
    
    Map<Id, Decimal> accMap = new Map<Id, Decimal>();
    for(Account a: Trigger.New){
        accMap.put(a.Id, a.Create_Opportunities__c);
        system.debug('entered in map');
    }
    List<Opportunity> oppList = new List<Opportunity>();
    if(AutoOppRecursiveCheck.checkonce())
    for(Account  a: Trigger.New){
        system.debug('entered in for loop');
        for(integer i = 0;i<accMap.get(a.Id); i++){
            system.debug('map value '+accMap.get(a.Id));
            Opportunity o = new Opportunity();
            o.Name = a.Name + i;
            o.CloseDate = Date.today();
            o.Discount_Percent__c = 10;
            o.StageName='Prospecting';
            o.Amount=100;
            o.AccountId = a.Id;
            oppList.add(o);
        }
    }
    
    insert oppList;

}