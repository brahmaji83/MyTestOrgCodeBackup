public class JSRemotingExample {
    public string accname {get;set;}    
    public static account account {get;set;}
    public List<Account> acc {get;set;}
    
    public void JSR(){
        system.debug('called JSR');
        acc = [select id, name from Account where name=:accname];
    }
    @RemoteAction
    public static Account getAccount(String accname){
        system.debug('eneted remote action '+accname);
        account = [select id, name from Account where name=:accname];
        system.debug('account '+account.name);
        return account;
    }
    
    @RemoteAction
    public static List<Account> getacc(String accname){
        system.debug('eneted remote action '+accname);
        return [select id, name from Account where name=:accname];
       // return acc;
    }

}