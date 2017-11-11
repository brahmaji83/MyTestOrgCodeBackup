trigger DuplicateOpp on Opportunity (after insert) {
    
    List<Opportunity> lopp = new List<Opportunity>();
    Opportunity opp;
    
    if(checkRecursive.runOnce()){
        for(Opportunity o:Trigger.New){
            opp = new Opportunity();
            opp.Name = o.Name;
            opp.CloseDate = o.CloseDate;
            opp.StageName = o.StageName;
            lopp.add(opp);
       //     insert lopp;
        }
    }
    if(lopp.size()>0){
        insert lopp;
    }
}