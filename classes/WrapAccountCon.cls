public with sharing class WrapAccountCon {
    public List<AccConWrapper> accConWrap {get;set;}
	public WrapAccountCon(){
		accConWrap = new List<AccConWrapper>();
		accConWrap = getAccCon();
	}
	 
	public List<AccConWrapper> getAccCon(){
		List<Account> accList = [select name, id, industry,(select firstname, id, lastname, email, phone from contacts)
								 from Account limit 50];
		List<AccConWrapper> accWrapperList = new List<AccConWrapper>();		
		for(Account a: accList){
			List<Contact> assocCon = new List<Contact>();
			for(Contact c : a.Contacts){
				assocCon.add(c);
			}
			accWrapperList.add(new AccConWrapper(a, assocCon));
		}	
		
		return accWrapperList;							 
	}    
    public class AccConWrapper {
    	public Account acc {get;set;}
    	public contact con {get;set;}
    	public List<Contact> conList {get;set;}
    	public AccConWrapper(Account a , List<Contact> cList){
    		this.acc = a;
    		this.conList = cList;
    	}
    }
}