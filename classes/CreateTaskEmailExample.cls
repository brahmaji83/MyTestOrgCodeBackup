global class CreateTaskEmailExample implements Messaging.InboundEmailHandler {
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env){
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
  
    String myPlainText= '';
	String LName;
	String FEmail;
	String ebody;
    
	LName = email.fromName; 
	FEmail = email.fromAddress;   
	ebody = email.subject;	                                                                                                                 
    // New Task object to be created	
	   Contact c = new Contact();
		c.Email = FEmail;
        c.LastName = LName;
		c.Description = ebody;                                                           
        insert c;
		System.debug('contact id '+c.Id);         
   // Return the result for the Apex Email Service
   return result;
  }
}