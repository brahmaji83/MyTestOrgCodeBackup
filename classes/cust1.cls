public class cust1 {
    List<Account> acts = [select name,id from Account limit 5];
    public List<Account> getacts(){
        return acts;
    }
    List<Contact> cons=[select id,lastname, firstname from contact limit 5];
    
    public List<Contact> getcons(){
        return cons;
    }
}