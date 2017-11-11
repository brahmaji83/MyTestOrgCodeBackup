public class childparentsoql {
    public List<Contact> con {set; get;}
    public Boolean flag1;
    public Boolean flag2;
    public void standardobj(){
        flag1=true;
        flag2=false;
        con = [select lastname, firstname, Account.Name from contact];
    }

}