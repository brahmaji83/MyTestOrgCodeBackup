trigger OpportunityCreation on Opportunity (after insert) {
    List<Opportunity> opp = new List<Opportunity> ();   
	public id oacc;
    for(Opportunity o:Trigger.New){
        opp.add(o); 
        
        oacc = o.accountid;
    }
    public date todaydate = date.today();
    List<Opportunity> opps = [select id from opportunity where accountid =:oacc and createddate>=:todaydate];
	system.debug('count'+oacc+'size'+opps.size());
    for(opportunity o: Trigger.New){
        if(opps.size()>2){
            o.addError('test');
        }
    
    }       
}