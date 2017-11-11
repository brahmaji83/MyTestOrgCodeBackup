trigger EventSession_Overlap on Event_Session__c (before insert, before update) {
    
    List<Event_Session__c> eses = new List<Event_Session__c>();
    Set<id> esd = new Set<Id>();
    for(Event_Session__c es : Trigger.new){
		eses.add(es);
        esd.add(es.Event__c);
    }
    
    List<Event_Session__c> existingsession = 
        [select name, Event_Session_Start_Date__c, Event_Session_End_Date__c from Event_Session__c where Event__c in:esd];
    
    for(Event_Session__c enew: Trigger.new){
        for(Event_Session__c eold:existingsession){
            if((enew.Event_Session_End_Date__c < eold.Event_Session_End_Date__c || enew.Event_Session_Start_Date__c>eold.Event_Session_Start_Date__c)
              && enew.Id != eold.Id){
                enew.addError('Overlapped with the session '+eold.name);
            }
        }
    }

}