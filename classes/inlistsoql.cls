public class inlistsoql {
	public List<Account> acc;
    public List<Contact> con;
    public void listvariable(){
        List<String> branches = new List<String>{'Banking','Energy'};
        acc=[select name, industry, id from Account where industry in: branches];
    }
}