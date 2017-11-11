public class PracticeActionSupport {
    public List<Account> accList{get;set;}    
    public void getdata(){
       system.debug('entered');
        accList= [select Id from Account limit 10];
    }

}