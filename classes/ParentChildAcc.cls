public class ParentChildAcc {
    public List<Account> accList {get;set;}
    
    public ParentChildAcc(){
        accList = [select id, Name, (select Id, LastName from Contacts) from Account limit 10];
    }
}