public class Screen2 {
    public Account account {get;set;}
    public PageReference save() {
        update account;
        pagereference pr = new pagereference ('/apex/pageref1?id='+account.id);
        return pr;
    }


    public screen2(){
        Id id = apexPages.currentpage().getparameters().get('id');
        Account = [select name, phone from account where id =:id];
    }
}