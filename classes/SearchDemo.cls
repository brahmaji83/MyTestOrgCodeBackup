public class SearchDemo {
    public String searchstring {get;set;}
    public List<Account> acc;
    public pagereference searchacc(){
        system.debug('entered');
        acc = [select id , name, industry from Account where name=:searchstring ];
        system.debug('size of acc '+acc.size());
        return null;
    }
    public List<Account> getacc(){
        return acc;
    }
}