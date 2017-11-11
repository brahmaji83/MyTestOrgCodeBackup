trigger PrabhasTest on Account (after update) {

    set<Id> accId = New set<Id>();
    
    for(Account a : Trigger.New){
         accId.add(a.Id);        
    }
    
    Map<Id,Account> acc = new Map<Id,Account>([select id,phone,(select id,firstname,phone from contacts)
                                           from account where id in : accId]);
    List<Contact> con = New List<Contact>();    
    
    for(Account a : acc.values()){
        
        for(Contact c : a.contacts){
            
            c.Phone = a.Phone;
            con.add(c);
        }        
    }
        update con;
}