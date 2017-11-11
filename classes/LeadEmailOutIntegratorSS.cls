public class LeadEmailOutIntegratorSS {
  
    private class EmailWrapper{
        public EmailWrapper(Lead theLead, EmailMessage theEmail, Task theTask){
            leadMember = theLead;
            emailMember = theEmail;
            taskMember = theTask;
        }
        public Lead leadMember{get;set;}    
        public EmailMessage emailMember{get;set;} 
        public Task taskMember{get;set;}
    }
    
   @AuraEnabled
    public static List<String> fetchExternalsystemNames(){
        List<String> lstconfigExtSystems = new List<String>();
 /*       for(LeadProcessConfiguration__c objext : [Select id, ExternalSystem__c from LeadProcessConfiguration__c where recordtype.developername =: System.Label.Recordtype_Externalsystem]){
            lstconfigExtSystems.add(objext.ExternalSystem__c);
        }
        lstconfigExtSystems.add(System.Label.External_User); */
        return lstconfigExtSystems;
    }
    
    
    @AuraEnabled
    public static void sendLeadToExternalSystem(String externalSystem, List<Id> leadIds,String extUserEmailId){   
        System.debug('entered apex');
        System.debug(externalSystem);
        System.debug(leadIds);
        System.debug(extUserEmailId);
        /*
    LeadEmailOutIntegratorSS.sendLeadToExternalSystem1(externalSystem,leadIds,extUserEmailId);
        System.debug('externalSystem : ' + externalSystem);
        System.debug('leadIds : ' + leadIds);
        System.debug('extUserEmailId : ' + extUserEmailId);
        List<Contact> lstContact = new List<Contact>();
        List<LeadProcessConfiguration__c> lstLpc = new List<LeadProcessConfiguration__c>();
        Map<String,Id> mapTargetIds = new Map<String,Id>();
        Map<String,Id> mapTargetIds1 = new Map<String,Id>();
        Map<String,Id> countEmail = new Map<String,Id>();
        
               
        lstLpc = [select id, TechnicalContact__c,TechnicalContact__r.email  from LeadProcessConfiguration__c where recordtype.developername =:System.Label.Recordtype_EmailSetting Limit 50000]; 
        if(externalSystem.equalsIgnorecase(System.Label.External_User) && extUserEmailId != null && !extUserEmailId.endswith('pl.abb.com')){   
            lstContact = [Select id, Email from contact where Email =: extUserEmailId order by createddate desc];
            if(!lstContact.IsEmpty()){ 
                for(Contact cntEmail : lstContact){
                    if(!countEmail.containskey(cntEmail.email)){
                        countEmail.put(cntEmail.email, cntEmail.id);
                        mapTargetIds.put(System.Label.External_User, lstLpc[0].TechnicalContact__c);
                        System.debug('cntEmail.id' + cntEmail.id);
                        mapTargetIds1.put(System.Label.External_User,cntEmail.id);
                        System.debug('mapTargetIds1' + mapTargetIds1);
                        }
                        
                }
                
            }else{
                List<account> lstacc = [Select id from account where Active__c =false and name =: System.Label.Technical_Account limit 1];
                if(!lstacc.IsEmpty()){

                    String eml = extUserEmailId;
                    String emailbeforelastname = eml.substringBefore('@');
                    Contact con = new Contact();
                    con.Firstname = System.Label.Contact_First_Name; // Custom Label - 'Technical Contact 
                    con.LastName =emailbeforelastname;              
                    con.Email= extUserEmailId;
                    con.accountId = lstacc[0].id;
                    insert con;
                    mapTargetIds.put(System.Label.External_User, con.id);
                }               
            }
            
        }else{
            /**
                Custom Label - 'ExternalSystem'
            */
    /*        List<LeadProcessConfiguration__c> lstLeadProcess = [Select id, ExternalSystem__c, TechnicalContact__c from LeadProcessConfiguration__c where recordtype.developername =: System.Label.Recordtype_Externalsystem and ExternalSystem__c =: externalSystem Limit 1];
            if(!lstLeadProcess.IsEmpty()){
                mapTargetIds.put(externalSystem, lstLeadProcess[0].TechnicalContact__c);    
            }       
        }
        set<Id> leadIdset = new set<Id>();
        leadIdset.addALL(leadIds);
        Map<id,String> mapExternalsystems = new Map<id,String>();
        for(Id objid : leadIds){
        
            mapExternalsystems.put(objid,externalSystem);
        
        }
        
        LeadEmailOutIntegratorUtil.emailSendingToLeads(leadIdset, mapExternalsystems ,mapTargetIds, 'Manual'); 
        if(!mapTargetIds1.keySet().isEmpty()){
           LeadEmailOutIntegratorUtil.emailSendingToLeads(leadIdset, mapExternalsystems ,mapTargetIds1, 'Manual');
        }
        
       */
    }
   
    @AuraEnabled
    public static List<Lead> sendLeadToExternalSystem1(String externalSystem, List<Id> leadIds,String extUserEmailId){
        
        
         System.debug('Inside New Method');
        //LeadEmailOutIntegratorSS.sendLeadToExternalSystem(externalSystem,leadIds,extUserEmailId);
        Set<String> lpcstatus = new Set<String>();
        Set<String> lpcrecordtype = new Set<String>();
   //     List<Lead> leadstatusrectype = [Select id, status, recordtype.developername from lead where id IN:leadIds];
        List<Lead> retunLeadList = new List<Lead>();
 /*      List<LeadProcessConfiguration__c> lpcstatsrectype = [Select id, LeadRecordTypeDevName__c, LeadStatus__c from LeadProcessConfiguration__c where recordtype.developername = 'SelectionCriteria'];
        for(LeadProcessConfiguration__c lp :lpcstatsrectype ){
            lpcstatus.add(lp.LeadStatus__c);
            lpcrecordtype.add(lp.LeadRecordTypeDevName__c);
            System.debug('999999999999999' + lpcrecordtype + lpcstatus );
        }

        for(Lead led :leadstatusrectype ){
            if(lpcstatus.contains(led.status) && lpcrecordtype.contains(led.recordtype.developername)){
                Lead compareLead = new Lead();
                compareLead.status = led.status;
                compareLead.recordtypeid = led.recordtypeid;
                retunLeadList.add(compareLead);
                System.debug('@@@ retunLeadList :::: ' + retunLeadList);
            }
        }
        System.debug('@@@ retunLeadList :::: ' + retunLeadList); */
        return retunLeadList;

    }
   
    
}