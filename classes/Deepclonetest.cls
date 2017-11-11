public class Deepclonetest {
    private Apexpages.StandardController controller {get;set;}
    private Purchase_Order__c po {get;set;}
    private List<Purchase_Order__c> po2 = new List<Purchase_Order__c>();
    
    public id newRecordid {get;set;}
    
    public Deepclonetest(Apexpages.StandardController controller){
        this.controller =controller;
        po = (Purchase_Order__c)controller.getRecord();                
    }
    
    public pagereference Clonewithitems(){
        savepoint sp = Database.setSavepoint();
        Purchase_Order__c npo;       
        try{
            for(Purchase_Order__c p:[select id, name,PO_Number__c,Ship_To__c from Purchase_Order__c where id=: po.id]){
            	//po2 = [select id, name from Purchase_Order__c where id=: po.id]; 
            	po.id = p.id;
                po.PO_Number__c=p.PO_Number__c;
                po=p;
            	
            }
            
            npo = po.clone();
            insert npo;
            
            
            newRecordid = npo.id;
            system.debug('after creation '+newRecordid);
            
            List<Purchased_Items__c> items = new List<Purchased_Items__c>();
        //    system.debug('before enter'+po.Id);
            Purchased_Items__c newpi;
            for(Purchased_Items__c p :[select id , name from Purchased_Items__c where Order__c=:po.id]){
                newpi = p;
            	newpi=p.clone(false);
                newpi.Order__c = npo.Id;
                items.add(newpi);
                system.debug('entered');
            }
            
        	insert items;
            system.debug('id');
        }            
        catch(Exception e){
			Database.rollback(sp);
            ApexPages.addMessages(e);
            return null;                
        }
     	return new pagereference('/'+npo.id);//+'/e?retURL=%2F'+npo.id);  
    }

}