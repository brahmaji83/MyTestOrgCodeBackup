Public class ActionSampleController {

    public List<Account> accs {get;set;}
    public string accNames{get;set;}
    Public string accName{get;set;}
    public boolean rend {get;set;}
    public string t {get;set;}
    public void searchaccount() {
        
        accs = [select name, industry, id from Account where name=:accName];
        rend = true;
    }


  
  //Using action Function
  Public void createAcccount(){
    Account acc = new Account ( Name = accName );
    insert acc;
    t ='Testing';
  } 
}