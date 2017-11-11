global class ContactBirthdate implements Database.Batchable<sObject>, Database.Stateful {
	global integer contacts;
    global date todaydate = Date.today();
    global Set<String> semails;
    global List<String> semail;
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([select Birthdate,id,email from contact where Birthdate=:todaydate]);
    }
    global void execute(Database.BatchableContext BC, List<Contact> scope){
        List<Contact> cons = new List<Contact>();
        
        semail = new List<String>();
        for(Contact c: scope){
            semail.add(c.Email);
        }
        List<String> myemail = new List<String>();
        myemail.add('brahmaji83@gmail.com');
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setBccAddresses(semail);
        mail.setToAddresses(myemail);
        mail.setSubject('Happy Birthday');
        mail.setPlainTextBody('Happy Birthday');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        
    }
    global void finish(Database.BatchableContext BC){
        system.debug('Do nothing'+semail.size());
        
    }
}