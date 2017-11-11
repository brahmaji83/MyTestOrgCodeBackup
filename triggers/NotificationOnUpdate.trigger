trigger NotificationOnUpdate on Account (before update) {
    
  //  Map<Id, Account> oldmap = Trigger.oldMap; 
    for(Account a : Trigger.New){
        if(a.Name <> Trigger.OldMap.get(a.Id).Name){
            system.debug('entered');
        }
    }
    
    
    //form query from fields in fieldset
    String Querystring = 'select ';
    String fieldsApiNames;
    for(Schema.FieldSetMember fld :SObjectType.Account.FieldSets.SampleFS.getFields()) {
        Querystring += fld.getFieldPath() + ', ';
    }
    Querystring += 'id from contact';
    System.debug('**Query string**'+Querystring );
//   List<contact> ConList = Database.query(Querystring);  


}