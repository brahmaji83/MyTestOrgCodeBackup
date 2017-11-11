trigger Account_CopyText on Account (after update) {    
    List<Account> acc1 = new List<Account>();
    List<Account> acc3 = new List<Account>();
    List<Contact> con1 = new List<Contact>();
    List<Contact> con3 = new List<Contact>();
    public boolean copied = false;
    public id accid;
    for(Account ac: Trigger.New){
        if(ac.Copy_it__c=='Copy'){
            copied=true;
            acc1.add(ac);
        }
    }
    con1= [select id, lastname, firstname, email from contact where accountid in :Trigger.New];
    system.debug('Copy'+copied);
    if(copied == true){
        for(Account act:acc1){
            Account a = new Account();
            a.Name = act.Name+'Copy';                        
            acc3.add(a);
            system.debug('Id'+accid);
        }
        insert acc3;
        accid = acc3[0].id;
        system.debug('rowid'+acc3[0].id);        
        for(Contact cons:con1){
            Contact con2= new Contact();
            con2.LastName = cons.lastname+'Copy';
            con2.FirstName = cons.firstname+'Copy';
            con2.Email = cons.Email;
            con2.AccountId = accid;
            con3.add(con2);
        }        
        insert con3;
    }
}