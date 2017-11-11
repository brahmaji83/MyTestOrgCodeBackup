trigger DuplicateCheck on Account (after insert) {
    
    Set<String> accNameSet = new Set<String>();
    Map<String, Account> accNameMap = new Map<String, Account>();
    for(Account a : Trigger.New){
        accNameSet.add(a.Name);
        accNameMap.put(a.Name, a);
    }
    List<Account> delList =Trigger.New;
    List<Account> accList = [select id, name from Account where name in: accNameMap.keySet()];
    List<Account> updList = new List<Account>();
    if(accList.size()>0)
    {
        for(Account acc: accList){
            for(Account anew : Trigger.New){
                acc.Name = anew.Name + 'New';
                acc.Industry = anew.Industry;
                updList.add(acc);
            }
            break;
        }
    }
    if(!updList.isEmpty()){
        update updList;
        List<Id> delIdList = new List<Id>();
        for(Account a: Trigger.New){
            delIdList.add(a.Id);
        }
        duplicatefuture.delduprec(delIdList);
    }
    
}