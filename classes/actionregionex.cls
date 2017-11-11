public class actionregionex {

    public Account myaccount {get;set;}
    
    public String accname {get;set;}
    public String accIndustry {get;set;}
    public List<Account> accList {get;set;}
    public integer acccount {get;set;}
    public actionregionex(){
        myaccount = new Account();        
    }
    
    public pagereference savethis(){
        accname = myaccount.Name;
        accIndustry = myaccount.Industry;
        system.debug('called');
        return null;
    }
    
    public pagereference checkthis(){
        accname = myaccount.Name;
        accList = [select id from account where name=: accname];
        
        acccount = accList.size();
        system.debug('count '+acccount);
        return null;
    }
}