trigger TriggerContextVariables on Account (before insert, before update, after insert, after update, before delete, after delete) {
    public string oldaccname;
    public string newaccname;
    if(Trigger.isBefore){
        if(Trigger.isDelete){
            for(Account a:Trigger.old){
                if(a.name=='Test'){
                    a.addError('You cannot delete');
                }
            }
        }
        
        if(Trigger.isUpdate){
            for(Account a:Trigger.New){
                newaccname = a.name;
                for(Account ac:Trigger.old){
                    oldaccname = ac.name;
                }
                if(oldaccname=='Test' && newaccname=='Testing'){
                a.addError('You cannot update')    ;
                }                  
            }

        }
    }
    
    else{
        if(Trigger.isInsert){
            List<Contact> con = new List<Contact>();
            for(Account a:Trigger.New){
                if(a.name=='Testing'){
                    con.add(new contact(lastname = a.Name, accountid=a.Id));
                }
            }
            insert con;
        }
    }

}