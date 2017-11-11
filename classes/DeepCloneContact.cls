public class DeepCloneContact {
    private ApexPages.StandardController controller {get;set;}
    public Contact con;
    public id conid;
    
    public DeepCloneContact(ApexPages.StandardController controller){
        this.controller =controller;
        con = (Contact) controller.getRecord();
    }
    
    public pagereference clonewithitems(){
        SavePoint sp = Database.setSavepoint();
        contact newcon;
        try{
            con = [select id, name, lastname, email, fax from contact where id=: con.Id];
            newcon = con.clone(false);
            insert newcon;
            conid = newcon.Id;
            
            Opportunity opp;
            List<Case> Caselist = new List<Case>();
            for(Case o:[select id from Case where ContactId =:con.id]){
				Case newOpp = o.clone(false);
                newOpp.ContactId = conid;
                Caselist.add(newOpp);
            }
            insert Caselist;
        }
        catch(Exception e){
            ApexPages.addMessages(e);
            return null;
        }
                
        return new pagereference('/'+conid+'/e?retURL=%2F'+conid);
    }

}