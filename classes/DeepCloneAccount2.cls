public class DeepCloneAccount2 {
    public ApexPages.StandardController controller;
    public Account acc;
    
    public DeepCloneAccount2(ApexPages.StandardController controller){
    	this.acc = (Account)controller.getRecord();
        this.controller = controller;
    }        
    
    public pagereference cloneaccount(){
        Id accId = acc.Id;
        Account newacc;
        acc = [select id, name, industry from Account where id=: accId];
        newacc = acc.clone(false);
        insert newacc;
        system.debug('newAcc '+newacc.Id);
        List<Contact> newCon = new List<Contact>();
        for(contact c: [select Id, name, lastname, email,phone from Contact where accountid =: accId]){
            contact con = c.clone(false);
            con.AccountId = newacc.Id;
            newCon.add(con);            
        }
        insert newCon;     
        system.debug('newcontact id '+newCon);
        return null;
    }

}