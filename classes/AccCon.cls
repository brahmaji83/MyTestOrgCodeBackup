public class AccCon {
    public List<Account> acc {get;set;}
    public List<Contact> con {get;set;}
    
    public AccCon(){
        acc  = [select name from account limit 5];
        con  = [select name from contact limit 5];
    }
}