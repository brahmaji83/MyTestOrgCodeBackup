public class SendMultipleEmails {
	public String subject       {get;set;}
    public String Emailbody     {set;get;}
//    private final Work_Order__c WO;
    public String sEmail         {get;set;}
    public String[] toAddresses;
    
     public PageReference send()
    {
        String[] toaddress = new String[]{sEmail};
        String[] arrTest = sEmail.split('\\;');
        system.debug('result'+arrTest);
        System.debug('Email :' + toaddress[0]);
        
       // List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        
         Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
        
            email.SetToAddresses(arrTest); 
            email.SetSubject(Subject);
            email.SetPlainTextBody(Emailbody);
            
           // emails.add(email);
    
        try{
           // Sends the email
        Messaging.SendEmailResult [] r = 
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email}); 
        
        //Messaging.sendEmail(emails);
        }
        
        catch(exception e){
        system.debug('Error message'+e.getMessage());
        system.debug('Error Line num'+e.getLineNumber());
        }
        
        return null;
                
    }
}