public class DeepCloneAccount {
    private Account a1 {get;set;}    
    private ApexPages.StandardController controller;
    private List<Account> acc = new List<Account>();
    public id accid;
    
    public DeepCloneAccount(ApexPages.StandardController controller){
        this.controller = controller;        
        a1 = (Account)controller.getRecord();        
    }
    
    public pagereference CloneAccount(){
        savepoint sp =Database.setSavepoint();
        Account a2;
        try{
           	a1 = [select id,name from Account where id=:a1.id];
            a2 = a1.clone();
            insert a2;
            List<Contact> con = new List<Contact>();
            for(contact c : [select lastname,firstname, email from contact where accountid=:a1.Id]){
                contact newc = c.clone();
                newc.AccountId=a2.Id;
                con.add(newc);
            }
            insert con;            
        }
        catch(Exception e){
            Database.rollback(sp);
            system.debug('Exception is'+e.getMessage());
        }
        return new pagereference('/'+a2.Id);
    }
}