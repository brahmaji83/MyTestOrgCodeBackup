public class Screen3 {

    public PageReference redirect() {
        pagereference pg = new pagereference('/apex/pageref3?id='+account.id);
        return pg;
    }


    public Account account {get;set;}
    public screen3(){
        Id id = apexPages.currentpage().getparameters().get('id');
        Account = [select name, phone from account where id =:id];
    }
}