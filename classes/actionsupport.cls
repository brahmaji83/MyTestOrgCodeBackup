public class actionsupport {
    public List<Account> acc{get;set;}
    public void syncaccounts(){
        acc = [select name, id, industry from account order by createddate desc limit 10];
    }
}