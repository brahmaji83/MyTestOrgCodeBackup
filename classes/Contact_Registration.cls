public class Contact_Registration {
    public contact con {get;set;}    
    public List<String> cemail= new List<String>();
    public string cmail;
    Org_Settings__c csettings = Org_Settings__c.getInstance('cnt');           
	public integer count{get;set;}
    
   // rcount = count;
    public Contact_Registration(){       
        con = new contact();          
        count = (integer)csettings.Counter__c;        
    }
    public pagereference updatepagecount(){	    
		csettings.Counter__c +=1;
        update csettings;
        return null;
    }
    public pagereference save(){
        insert con;
    //    cemail = [select email from contact where id=:con.Id];
        cemail.add(con.Email);
        sendmail();
        pagereference pg = new pagereference('/'+con.id);
        pg.setRedirect(true);
        return pg;
    }
    public void sendmail(){    
                
        // First, reserve email capacity for the current Apex transaction to ensure
        // that we won't exceed our daily email limits when sending email after
        // the current transaction is committed.
        Messaging.reserveSingleEmailCapacity(2);
        
        // Processes and actions involved in the Apex transaction occur next,
        // which conclude with sending a single email.
        
        // Now create a new single email message object
        // that will send out a single email to the addresses in the To, CC & BCC list.
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        // Strings to hold the email addresses to which you are sending the email.
        String[] toAddresses = new String[] {'brahmaji83@gmail.com'}; 
        String[] ccAddresses = new String[] {'brahmaji83@gmail.com'};
          
        
        // Assign the addresses for the To and CC lists to the mail object.
        mail.setToAddresses(cemail);
        mail.setCcAddresses(ccAddresses);

		        
        // Specify the address used when the recipients reply to the email. 
        mail.setReplyTo('brahmalearning@gmail.com');
        
        // Specify the name used as the display name.
        mail.setSenderDisplayName('Salesforce Support');
        
        // Specify the subject line for your email address.
        mail.setSubject('Your account has been created : ' + con.Id);
        
        // Set to True if you want to BCC yourself on the email.
        mail.setBccSender(false);
        
        // Optionally append the salesforce.com email signature to the email.
        // The email address of the user executing the Apex Code will be used.
        mail.setUseSignature(false);
        
        // Specify the text content of the email.
        mail.setPlainTextBody('Your contact: ' + con.Id +' has been created.');
        
        mail.setHtmlBody('Your contact:<b> ' + con.Id +' </b>has been created.<p>'+
             'To view your case <a href=https://ap2.salesforce.com/'+con.Id+'>click here.</a>');
        
        // Send the email you have created.
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });       
    }
}