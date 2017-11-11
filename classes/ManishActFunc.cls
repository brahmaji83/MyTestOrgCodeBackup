public class ManishActFunc {
    
    public List<Account> accList {get;set;}
    public string accname {get;set;}
    
    public void getaccdata(){
        system.debug('entered');
        String accString = '%'+accname+'%';
        accList = [select Id, Name from Account where name like: accString];
        system.debug(accList.size());
    }

}