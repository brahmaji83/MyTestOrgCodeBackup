public class SendanEmailAccCount {
    public void getcount(){
        List<Account> acc = [select Id from account];
        integer count = acc.size();
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        List<String> maillist = new List<String>();
        maillist.add('brahmaji83@gmail.com');
        mail.toaddresses = maillist;
        mail.subject = 'Account count';
        mail.plaintextbody=  'Number of Accounts in your org'+String.valueOf(count);
        
        Messaging.SingleEmailMessage[] smail = new List<Messaging.SingleEmailMessage>{mail};
        Messaging.sendEmail(smail);
        
    }

}