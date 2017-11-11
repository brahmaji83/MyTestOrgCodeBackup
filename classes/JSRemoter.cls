public class JSRemoter {
    public static Account acc{get;set;}	
    public static List<Account> acct;
    public string accname {get;set;}
    public JSRemoter(){
        
    }
    
    @RemoteAction
    public static List<Account> getAcc(String accname){
        acct = [select id,name from Account where name=:accname];
        return acct;
        
    }
}