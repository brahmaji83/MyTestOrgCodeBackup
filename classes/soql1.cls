public class soql1 {
    public List<Account> accs {set; get;}
    public soql1(){
     	accs = [select id, name, industry from Account];
    } 
    public void getOffset(){
        accs = [select id, name, industry from Account offset 5];
    }
    Public void getlimit(){
        accs = [select id, name, industry from Account offset limit 5];
    }
}