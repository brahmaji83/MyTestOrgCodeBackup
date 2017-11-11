trigger Account_ProspectCheck on Account (before update) {
    for(Account acc: Trigger.New){
        Account acct = Trigger.oldmap.get(acc.Id);
        
        system.debug('cjount'+acct.Id);
        string stype = acct.Type;
        system.debug('cjount'+stype);

        if(acct.Type!= 'Prospect' && acc.Type=='Prospect'){
            acc.Is_it_a_Prospect__c=true;
            system.debug('entered -if');            
        }
        else if(acct.Type!= 'Prospect'){
            acc.Is_it_a_Prospect__c=false;
            system.debug('entered - else');
        }
        
    }
}