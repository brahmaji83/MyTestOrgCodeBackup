trigger ApexManagedSharingEvent on Event__c (after insert) {
    List<Event__Share> ev = new List<Event__Share>();
    
    if(trigger.isinsert){
        Event__Share es;
        for(Event__c e:Trigger.New){
            es = new Event__Share();
            
            es.ParentId = e.id;
            es.RowCause = schema.Event__Share.rowcause.Custom_Sharing__c;
            es.UserOrGroupId = '00528000002O3yv';
            es.AccessLevel='read';
            ev.add(es);
            system.debug('test'+es.RowCause);
        }
        Database.SaveResult lsr = Database.insert(es,false);
    /*    integer i =0;
        for(Database.SaveResult sr: lsr){
            if(!sr.isSuccess()){
                Database.Error err = sr.getErrors()[0];
                if(!(err.getStatusCode() == StatusCode.FIELD_FILTER_VALIDATION_EXCEPTION  
                                               &&  err.getMessage().contains('AccessLevel'))){
                    // Throw an error when the error is not related to trivial access level.
                    trigger.newMap.get(es[i].ParentId).
                      addError(
                       'Unable to grant sharing access due to following exception: '
                       + err.getMessage());
                                               }
            }
                
            i++;    
        }
*/        
        
    }

}