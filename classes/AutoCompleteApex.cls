public class AutoCompleteApex {
    public List<Account> accNameList {get;set;}  
    public List<String> availAccts; 
    public string accName {get;set;}
    public Map<Id, String> accMap ;
    public String selectedAccount {get; set;}
    public AutoCompleteApex(){        
        String saccName = '%' + accName + '%';
         
    }
        
    public void callctrl(){
    //    List<Account> acc =[select Id, Name from Account];
        for(Account a: accNameList){
            availAccts.add(a.Name);
        }
       
    }
    public String getavailAccts(){
        accNameList = new List<Account>();
        availAccts = new List<String>();
     //   accMap = new Map<Id,String>();
        accNameList = [select id, Name from Account];// where name =: saccName ];
        for(Account a: accNameList){
            availAccts.add(a.Name);
      //      accMap.put(a.Id, a.Name); 
        }        
     //   system.debug('size of the map '+accMap.size());
        system.debug('size of list'+availAccts.size());
        return JSON.serialize(availAccts);
    }
    
    public String getaccMap(){
        accMap = new Map<Id,String>();
        accNameList = [select id, Name from Account];// where name =: saccName ];
        for(Account a: accNameList){
         //   availAccts.add(a.Name);
            accMap.put(a.Id, a.Name); 
        }  
        return JSON.serialize(accMap);
    }

    public pagereference Saveit(){
		Account a = new Account();
		a.Name =  accName;
        insert a;
        system.debug('account id '+a.Id);
        return null;
    }
}