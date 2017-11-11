public class listofrecords {
    public List<Account> lacc {get;set;}
	public List<Contact> lcon {get;set;}
    public List<Opportunity> lopp {get;set;}
    
    public listofrecords(){
        lacc = [select id, name from Account limit 10];
        lcon = [select id, name from Contact limit 10];
        lopp = [select id, name from Opportunity limit 10];
    }
}