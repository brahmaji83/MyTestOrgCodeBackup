public class SearchAccount {
    transient string acc {get;set;}
    public List<Account> lacc {get;set;}
    public boolean accr  {get;set;}
    public searchaccount(){
        accr = false;
    }
        
    
    public pagereference searchacc(){
        lacc = [select name, industry from account where name=:acc];
        accr = true;
        if(lacc.size()==0){
            Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.WARNING,'No Accounts found'));
            accr = false;
        }
        pagereference pg =new pagereference('/apex/hello1');
        return pg;
        
    }

}