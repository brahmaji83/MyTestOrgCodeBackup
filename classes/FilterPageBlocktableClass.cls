public class FilterPageBlocktableClass {
    public Account a {get;set;}
    public List<Account> accList {get;set;}
    public FilterPageBlocktableClass(){
        a= new Account();
        accList = [select Id, Name, Industry , Phone from Account];
    }
    public void applychange(){
        system.debug('entered');
        accList = [select Id, Name, Industry , Phone from Account where Industry =: a.Industry];
    }
}