public class screen1 {
    public Account account {get;set;}
    public PageReference save() {
        insert account;
        pagereference pr = new pagereference ('/apex/pageref2?id='+account.id);
        return pr;
    }


    public screen1(){
        Account = new account();
    }
}