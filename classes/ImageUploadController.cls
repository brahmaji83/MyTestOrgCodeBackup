public class ImageUploadController {
    
    @AuraEnabled
    public static Property_Image__c createEntry(Id parentId, String cloudURL, Boolean primaryflag){
        System.debug('called server');
        Property_Image__c newpi = new Property_Image__c();
        newpi.Opportunity__c = parentId;
        newpi.Cloudinary_URL__c = cloudURL;
        newpi.Primary__c = primaryflag;
        insert newpi;
        return newpi;
    }
    
    @AuraEnabled
    public static Boolean checkPrimaryImage(Id parentId){
        if(parentid <> null){
            List<Property_Image__c> lstProp = [select id from Property_Image__c where Opportunity__c =: parentId and Primary__c = true];
            if(! lstProp.isEmpty()){
                return true;
            }
            else{
                return false;
            }
        }else{
            return false;
        }        
    }

}