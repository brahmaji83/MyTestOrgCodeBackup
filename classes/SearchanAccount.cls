public class SearchanAccount {
    public List<Account> acc {get;set;}
    public string accname {get;set;}
    public boolean accrender {get;set;}
    
    public SearchanAccount(){
       // accrender = false;
    }
    public pagereference SearchAccount(){
        if(accname==''){
        	acc = [select name,id from account];
            accrender = true;
        }
        else
        {
            acc = [select name, id from Account where name=:accname];
            accrender = true;
        }                
        return null;
    }
}