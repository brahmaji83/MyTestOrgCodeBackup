public class Searchcontroller {
    public List<Account> saccs {get;set;}
    public string acc {get;set;}
    public void searchac(){
        saccs = [select name, id from Account where name=:acc];
    }
}