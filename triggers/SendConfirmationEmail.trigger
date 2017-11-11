trigger SendConfirmationEmail on Session_Speaker__c (after insert) {
    
    List<Id> sessionspeakerIds = new List<Id>();
    
    for(Session_Speaker__c ss : Trigger.new){
        sessionspeakerIds.add(ss.Id);
    }
    
    List<Session_Speaker__c> sessionSpeakers  = new List<Session_Speaker__c>();
    sessionSpeakers = [select Id, 
                       		Session__r.Name,
                       		Session__r.Session_Date__c,
                       		Session__r.Level__c, 
                       		Speaker__r.Email__c,
                       		Speaker__r.First_Name__c from Session_Speaker__c where id in:sessionspeakerIds];
    if(sessionSpeakers.size() > 0){
        Session_Speaker__c sSpeaker = sessionSpeakers[0];
        if(sSpeaker.Speaker__r.Email__c != null){
            String address = 'brahmaji83@gmail.com';
            String Subject = 'Thsi si my subject';
            String message = 'Dear Customer, Come here';
            EmailManager.sendMail(address,Subject,message);
        }
    }
    

}