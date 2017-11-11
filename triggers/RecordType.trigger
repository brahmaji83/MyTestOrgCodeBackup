trigger RecordType on Project__c (before insert, before update) {    
    public String spold;
    public String spnew;
    for(Project__c p :Trigger.New){
        spnew = p.Priority__c;
        for(Project__c pold : Trigger.old){
            spold = pold.Priority__c;
        }
        p.Audit_Field__c = 'Priority field is updated from '+spold+' to '+spnew+' by '+UserInfo.getUserEmail() + ' on '
                					+System.now() + '\n' +p.Audit_Field__c;
        
    }

}