trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
	public string stg;
    List<Opportunity> opts = Trigger.New;
    List<Task> ltsk = new List<Task>();
    for(Opportunity opp:opts){
        stg = opp.StageName;
        if(stg =='Closed Won'){
            ltsk.add(new task(Subject='Follow Up Test Task', WhatId=opp.Id));            
        }            
    }
    insert ltsk;
}