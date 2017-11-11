public class wizardcontroller {
    public Account a {get;set;}
    public opportunity o{get;set;}
    public contact c{get;set;}

    public wizardcontroller(){
        a= new Account();
        o = new opportunity();
        c = new contact();
    }
    
    public pagereference save(){
        insert a;
        o.AccountId = a.id;
       	c.accountid = a.Id;
        insert o;
        insert c;
        return null;
    }
    
    public pagereference gotopage2(){
        return page.page2;
    }
    
    public pagereference gotopage3(){
        return page.page3;
    }
    public pagereference gotopage1(){
        return page.pageWizard;
    }  
    public pagereference reviewpage(){
        return page.reviewpage;
    }      
    
}