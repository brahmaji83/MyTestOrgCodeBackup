trigger DuplicateContactCheck on Contact (before insert, before update) {
Set<String> setEmail = new set<String>();
    Set<String> setPhone = new set<String>();
    Set<String> setExistingEmail = new set<String>();
    Set<String> setExistingPhone = new set<String>();
    
    for(Contact con : Trigger.new)
    {
        setEmail.add(con.email);
        setPhone.add(con.Phone);
    }
    List<Contact> lcon = [SELECT Phone,Email FROM contact WHERE email in : setEmail AND phone in : setPhone];
    system.debug('size of lcon '+lcon.size());
   
    if(lcon.size() > 0){
        for(contact c:Trigger.New)
        c.addError('Error found');
    }

    for(Contact con : [SELECT Phone,Email FROM contact WHERE email in : setEmail AND phone in : setPhone])
    {
        setExistingEmail.add(con.email);
        setExistingPhone.add(con.Phone);
    }
       if(Trigger.isInsert||Trigger.isUpdate)
    for(Contact a:trigger.new)
     {
        if(setExistingEmail.contains(a.email) && setExistingPhone.contains(a.Phone))
        {
            a.adderror('This Phone and email already exists');
        }
    }

}