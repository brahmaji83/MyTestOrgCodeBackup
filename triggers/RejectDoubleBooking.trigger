trigger RejectDoubleBooking on Session_Speaker__c (before insert, before update) {
    
    List<Id> speakerIds = new List<Id>();
    Map<Id, DateTime> requested_bookings = new Map<Id,DateTime>();
    
    for(Session_Speaker__c speaker : Trigger.New){
        requested_bookings.put(speaker.Session__c , null);
        speakerIds.add(speaker.Speaker__c);
    }
    List<Session__c> related_sessions = [select
                                                 Id,  
                                                 Session_Date__c
                                                 from Session__c 
                                                 where Id in:requested_bookings.keySet()];
    
    for(Session__c related_session: related_sessions){
        requested_bookings.put(related_session.Id, related_session.Session_Date__c);
    }
    
    List<Session_Speaker__c> releated_Spearkers = new List<Session_Speaker__c>();
    releated_Spearkers = [select Id, Speaker__c, Session__c, Session__r.Session_Date__c from
                         Session_Speaker__c where Speaker__c  in: speakerIds];
	
    for(Session_Speaker__c sSpeaker : trigger.new){
        DateTime booking_time = requested_bookings.get(sSpeaker.Session__c);
        
        for(Session_Speaker__c speakerCheck : releated_Spearkers){
            if((speakerCheck.Speaker__c == sSpeaker.Speaker__c) && 
               (speakerCheck.Session__r.Session_Date__c == booking_time)){
                   system.debug('entered here');
                   		sSpeaker.addError('Already a booking there');
               }
        }
       
    }
}