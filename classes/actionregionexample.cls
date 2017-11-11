public class actionregionexample {
    
    public id accid {get;set;}
    public account accobj {get;set;}
    public actionregionexample(){
        accobj  = new Account();
    }
    
    public void dosearch(){
        List<Account> acc = new List<Account>();
        acc = [select id, name,industry from Account where id=:accid];
        if(acc.size()>0){
            accobj=acc[0];
        }
        else{
            ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.INFO, 'No Records found');
            Apexpages.addMessage(msg);
        }
    }

}