public class ManishSearch {
    
    public string accname {get;set;}
    public List<Account> allacc {get;set;}
	
    public pagereference searchanacc(){
        allacc = [select id, name, industry from Account where name =: accname ];
        return null;
    }
}