trigger CustomSettingsSwitch on Account (before insert, before update) {
    
    TriggerSwitch__c ts = TriggerSwitch__c.getInstance('ManageRecord');
    String cSwitch = ts.Switch__c;
    String caccName  =ts.AccountName__c;
    system.debug('cSwitch '+cSwitch);
    system.debug('cSwitch '+caccName);
    if(cSwitch =='Y'){
        for(Account a:Trigger.New){
            if(a.name == caccName){
                a.addError('this is coming from custom settings');
            }
        }
    }
    

}