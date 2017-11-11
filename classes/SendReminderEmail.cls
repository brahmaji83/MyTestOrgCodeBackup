global class SendReminderEmail implements Database.Batchable<sObject> {
    global String query;
    global String Subject;
    global String body;
    
    global SendReminderEmail(String query, String Subject, String body){
        this.query = query;
        this.Subject = Subject;
        this.body = body;
        
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Speaker__c> ss) {
        
        for(Speaker__c s: ss){
            EmailManager.sendMail(s.Email__c , Subject, body);
        }
    }
    
    global void finish(Database.BatchableContext BC){
        
    }

}