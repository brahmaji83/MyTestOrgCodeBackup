public with sharing class SearchAccountLookup {
    public string accname {get;set;}
    public List<Account> looupaccts {get;set;}    
    public Account acc{get;set;} 
    public Address__c addr {get;set;}
    
    public SearchAccountLookup(){
        addr = new Address__c();
        acc = new Account();
        system.debug('called');
    }
    public pagereference GetAccounts(){
        system.debug(accname);
        looupaccts = [select id, name, Industry from account where name=:accname];
        system.debug('acc size '+looupaccts.size()); 
        return null; 
    }
    public pagereference SaveAddress(){
        system.debug('address create reqesut');
        insert addr;
        system.debug('addr id '+addr.Id);
        return null;
    }
    
    public pagereference saveaccount(){
        insert acc;
        return null;
    }
    

}