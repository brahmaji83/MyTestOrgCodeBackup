public class concustcontr {
    
    List<Contact> co = [select firstname, lastname, id from Contact];
    public List<Contact> getCons() {
        return co;
    }
    
    List <Account> acc = [select name, id, type, industry from Account];
    public List<Account> getaccs(){
        return acc;
    }
    PageReference prospectaccs(){
        acc = [select name, id, industry, type from Account where type = 'Prospect'];
        return null;
    }
}