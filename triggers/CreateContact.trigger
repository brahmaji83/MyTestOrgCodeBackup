trigger CreateContact on Account (after insert) {
    
    Map<Id, Decimal> macc = new Map<Id, Decimal>();
    for(Account a:Trigger.new){
		macc.put(a.Id, a.Create_Contacts__c);
    }
	List<Contact> conList = new List<Contact>();
    for(Account a: Trigger.New){
        for(integer i=0; i< macc.get(a.Id); i++){
            contact c = new contact();
            c.LastName = a.Name + i;
            c.Email = 'brahmaji83@gmail.com';
            c.AccountId = a.Id;
            conList.add(c);
        }
    }
    
    if(!conList.isEmpty())
    Insert conList;
    
    List<Account> acc = new List<Account>();
    //To create child account records
    if(RecursiveCheck.dupcheck()){
        for(Account a:Trigger.new){
            Account aCreate = new Account();
            acreate.Name = a.Name;
            acc.add(acreate);
        }
    }
    
    
    Insert acc;
    system.debug('account id is '+acc[0].id);
    
    
}