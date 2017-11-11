trigger CountOfAttach on Attachment (after insert) {
    
    Set<Id> OppId = new Set<Id>();
    for(Attachment a: Trigger.New){
        OppId.add(a.ParentId);
    }
    List<Opportunity> OppList = [select id, (select id from Attachments) 
                                 from Opportunity where id in: OppId];
    List<Opportunity> OppListUpd = new List<Opportunity>();
    for(Opportunity o : OppList){
        o.Attachment_Count__c = o.Attachments.size();
        OppListUpd.add(o);
    }
    
    if(!OppListUpd.isEmpty()){
        update OppListUpd;
    }
}