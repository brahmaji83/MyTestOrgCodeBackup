public class RajeeActonFunction {
    public string searchkey {get;set;}
    public List<Account> accList {get;set;}
    
    public void searchacc(){
        accList = [select id, name from Account where name=: searchkey ];
        system.debug('entered to searchacc');
    }
    
}