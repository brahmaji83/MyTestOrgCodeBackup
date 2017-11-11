public with sharing class RelatedListController {
	
    
    @AuraEnabled
    public static List<fieldWrapper> getFieldLabels(String myObjectName, List<String> lstChildObjects){
        system.debug('test');
        List<fieldWrapper> lstFieldWrapper = new List<fieldWrapper>();
        DescribeSObjectResult objectDescribe = Schema.getGlobalDescribe().get( myObjectName ).getDescribe();
        Set<String> lstChildRel = new Set<String>();
      
        for(Schema.ChildRelationship sc : objectDescribe.getChildRelationships()){
            System.debug(sc);
            DescribeSObjectResult DobjectDescribe = Schema.getGlobalDescribe().get(String.valueOf(sc.getChildSObject())).getDescribe();
            if(DobjectDescribe.isAccessible()){                
            	lstChildRel.add(String.valueOf(sc.getRelationshipName()));    
            }            
        }
        List<String> lstIndia = new List<String>();
        for(String eachStr : lstChildObjects){
            if(lstChildRel.contains(eachStr)){                
                lstIndia.add(eachStr);                
            }
        }
        
        return lstFieldWrapper;
    }
    
    public class fieldWrapper{
        @AuraEnabled
        public String relLabel {get;set;}
        @AuraEnabled
        public String relApiName {get;set;}
        
        public fieldWrapper(String strLab, String strApi){
            this.relLabel = strLab;
            this.relApiName = strApi;
        }
    }
}