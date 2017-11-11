trigger DuplicateAccount on Account (after insert) {
    
    public List<Account> acc = new List<Account>();
    public Account ac;
    
    if(DuplicateCheck.runonce()){
        for(Account a:Trigger.New){
            ac = new Account();
            ac.Name = a.Name;
            ac.Industry = a.Industry;
            acc.add(ac);        
        }
	}    
    insert acc;

}