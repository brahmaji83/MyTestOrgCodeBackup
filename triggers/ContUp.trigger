trigger ContUp on Contact (after insert, before insert) {
    
    public string accname;
    
    
    for(Contact c: [select id, name ,phone, account.name from contact where id=:Trigger.New])
    {
        accname = c.account.name;
        system.debug('accname'+accname);
        if(accname=='Test'){
            c.phone = '000';
            update c;
        }
    }
    
    

}