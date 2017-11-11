public with sharing class CloneExampleLC {
    @AuraEnabled    
    public static Account createRec(Id modelId){
        system.debug('entered');                
        Account oldAcc = [select Id,Name, Industry,Description,Rating from Account where id =: modelId];
        system.debug('oldAcc details-->'+oldAcc);
        
        Account newAcc = oldAcc.clone(false,false,false,false);
        return newAcc;
    }
    
    
    @AuraEnabled
    public static Account[] getRec(){
        return [select id from Account limit 10];
    }
    
    @AuraEnabled
    public static Account cloneaRecord(Id modelId){
        String query ='';
        String SobjectApiName = 'Account';
        
        Account a = [select Clone__c from Account where Id=: modelId];
        if(a.Clone__c == true){                    
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();
            system.debug(fieldMap);
            String strFields = '';
            List<Schema.FieldSetMember> fsmember = SObjectType.Account.FieldSets.CloneIds.getFields();	
            Set<String> lstFSFields = new Set<String>();
            for(Schema.FieldSetMember FSM : fsmember){
                system.debug(FSM.getType());
                lstFSFields.add(String.valueOf(FSM.getFieldPath().toLowerCase()));
            }
            system.debug(lstFSFields);
            for(String fieldName : fieldMap.keyset() )
            {
                if(strFields == null || strFields == '')
                {
                    if(!lstFSFields.contains(fieldname)){
                        system.debug(fieldname);
                        strFields = fieldName;
                    }   
                    
                }else{
                    if(!lstFSFields.contains(fieldname)){
                        system.debug(fieldname);
                        strFields = strFields + ' , ' + fieldName;
                    }                
                }
            }
            system.debug(strFields);
            query = 'select ' + strFields + ' from ' + SobjectApiName + ' where id = \''+modelId+'\'';
            system.debug(query);
            Account acc = database.query(query);
            
            Account newAcc = acc.clone(false,false,false,false);
            return newAcc;
        }
        else{
            return null;
        }
    }
    
}