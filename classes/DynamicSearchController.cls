public with sharing class DynamicSearchController {
    
    @AuraEnabled
    public static List<campaignmember> getRecords(String searchStr, Id recId){
        //return [select Id, Name,Industry, Description, createddate from Account where name=: searchStr];
        return [select id,name,email,status from campaignmember where campaignId=: recId and name=: searchStr];
    }
    
    @AuraEnabled
    public static List<String> getPicklistValues(String strFieldName, String strObjectName){
        List<String> lstFieldsFromFS = new List<String>();
        if(!String.isBlank(strFieldName)){           
            List<Schema.PicklistEntry> lstPickValues = 
                Schema.getGlobalDescribe().get(strObjectName).getDescribe().fields.getMap().get(strFieldName).getDescribe().getPickListValues();            
            for(Schema.PicklistEntry eachValue : lstPickValues ){
                lstFieldsFromFS.add(String.valueOf(eachValue.getValue()));
            }
        }
        return lstFieldsFromFS;
    }
    
    @AuraEnabled
    public static List<String> getFieldsFromFSApex(String strFieldSetName, String strObjectName){
        List<String> lstFieldsFromFS = new List<String>();
        if(!String.isBlank(strFieldSetName)){
            Map<String, Schema.SObjectType> GlobalDescribeMap = Schema.getGlobalDescribe(); 
            Schema.SObjectType SObjectTypeObj = GlobalDescribeMap.get(strObjectName);
            Schema.DescribeSObjectResult DescribeSObjectResultObj = SObjectTypeObj.getDescribe();            
            Schema.FieldSet fieldSetObj = DescribeSObjectResultObj.FieldSets.getMap().get(strFieldSetName);
            System.debug(fieldSetObj);                
            for(Schema.FieldSetMember sf : fieldSetObj.getFields()){
                System.debug('entered inside fsm');
                lstFieldsFromFS.add(String.valueOf(sf.getFieldPath()));
            }
        }
        else{
            lstFieldsFromFS.add('Id');
            lstFieldsFromFS.add('Name');
        }
        
        return lstFieldsFromFS;
    }
}