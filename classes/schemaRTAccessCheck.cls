public with sharing class schemaRTAccessCheck {
	 @AuraEnabled        
    public static void getRecordtypeinfo(){
        List<Schema.RecordTypeInfo> recordtypes = Account.SObjectType.getDescribe().getRecordTypeInfos();    
        for(RecordTypeInfo rt : recordtypes){
            System.debug(rt.getName());            
        }
    }
}