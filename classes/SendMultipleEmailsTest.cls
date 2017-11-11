@isTest
public class SendMultipleEmailsTest {
    
    static testmethod void smts(){
        smt();
        nagativecase();
    }
    static void smt(){
        SendMultipleEmails smt = new SendMultipleEmails();
        smt.Emailbody='Your email body is ready';
        smt.sEmail='brahmaji83@gmail.com;rapola.mohan@gmail.com';
        smt.subject='Your Subjct';
   //    smt.toAddresses='brahmaji83@gmail.com;rapola.mohan@gmail.com';
     	
        test.startTest();
        integer emailcount = limits.getEmailInvocations();
        system.debug('emailcount'+emailcount);
        smt.send();
        system.assertEquals(1, limits.getEmailInvocations(), 'Success');
  //      test.stopTest();
    }
        static void nagativecase(){
        SendMultipleEmails smtn = new SendMultipleEmails();
        smtn.Emailbody='Your email body is ready';
   //     smt.sEmail='brahmaji83@gmail.com;rapola.mohan@gmail.com';
        smtn.subject='Your Subjct';    	
  //      test.startTest();
        integer emailcounts = limits.getEmailInvocations();
        system.debug('emailcountnative'+emailcounts);
        try{
            smtn.send();
        }
            
        catch(system.NullPointerException e){
            system.debug('Exception'+e.getMessage());
        	system.assertEquals('Attempt to de-reference a null object',e.getMessage());
        }
            
        test.stopTest();
    }
}