public class accountprospect {
    List<Account> acc = [select name from Account];

    
    public List<Account> getprospectaccs(){
        return acc;
    }
    public pagereference gotov(){
        return Page.hello5;
    }
}