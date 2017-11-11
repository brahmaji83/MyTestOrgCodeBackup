public class freelancerclass {
    public List<Contact> conList {get;set;}
    public List<Account> accLists {get;set;}
    public List<Opportunity> oppLists {get;set;}
    public List<Case> caseLists {get;set;}
    
    public freelancerclass( ApexPages.StandardController ctr){
    	conList = new List<Contact>();
   		accLists = new List<Account>();
        oppLists = new List<Opportunity>();
        caseLists = new List<Case>();
  //      conList = [select id, lastname, firstname, email, phone 
  //                 from contact 
  //                 where accountid =: ApexPages.currentPage().getParameters().get('id')];
        accLists = [select Id, Name, 
                   (select id, lastname, firstname, email, phone from contacts) ,
                   (select id, name from Opportunities),
                   (select id, Type from cases)
                   from Account 
                   where id =: ApexPages.currentPage().getParameters().get('id')];
      //  system.debug('size of the list '+conList.size());
        system.debug('id of the url '+ApexPages.currentPage().getparameters().get('id'));
        
        for(Account a: accLists){
            for(Contact c: a.contacts){
                conList.add(c);
            }
            for(Opportunity o: a.Opportunities){
                oppLists.add(o);
            }
            
            for(Case cs: a.Cases){
                caseLists.add(cs);
            }
        }
    }

}