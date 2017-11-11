public class triggerexample {
    public static string newaccindustry;
    public static string oldaccindustry;
    public static void beforeupdate(List<Account> accs){
        for(Account a:accs){
           oldaccindustry = a.Industry;
        }
    }    
    public static void afterupdate(List<Account> accs){
        
        for(Account b:accs){
           newaccindustry = b.Industry;
            if(newaccindustry=='Banking' && oldaccindustry=='Education'){

                b.addError('Update from Education to Banking has been restricted by Brahma in trigger2');
            }
            else{
                List<Contact> cons = new List<Contact>();
                Contact c = new Contact();
                c.accountid=b.Id;
                c.LastName=b.name;
                c.Phone=b.AccountNumber;
                cons.add(c);
            }
        }
    }
  

}