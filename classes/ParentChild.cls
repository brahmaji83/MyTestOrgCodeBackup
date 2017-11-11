public class ParentChild {
    public List<Account > acc;
    public List<Account> getacc(){
        acc = [select name from account limit 10];
        return acc;
    }    
}