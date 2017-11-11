trigger AccountPhone on Account (after update) {
    
    List<Case> clist = new List<Case>();
    List<Case> clist2 = [select id,DummyPhone__c from case where accountid=:Trigger.New];
    for(Account a:Trigger.New){
        for(Case c:clist2){
            c.DummyPhone__c = a.Phone;
            clist.add(c);
        }
    }
    update clist;
}