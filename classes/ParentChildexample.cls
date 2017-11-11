public class ParentChildexample {
    public List<Account> acc {get;set;}
    public ParentChildexample(){
        acc = [select name, Id, (select Id, lastname from contacts) from account limit 10];
    }

}