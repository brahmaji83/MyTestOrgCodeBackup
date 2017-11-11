public class PracticePageController {
    
    public string conFirstName{get;set;}
    public string conLastName{get;set;}
    public string conEmail{get;set;}
    public contact con{get;set;}
	ViewCounter__c vc = ViewCounter__c.getInstance('Data');
    public integer count {get;set;}
    public PracticePageController(){
        con = new contact();
        count = (integer) vc.UpdateCount__c;        
        system.debug('count'+count);
    }
    
    public pagereference save(){
        insert con;
        return null;
    }
            
    public void updateCount(){
		
        if(count == null){
            vc.UpdateCount__c = 1;
        }
        else
        {
        	vc.UpdateCount__c +=1;
        }    
        update vc;
    }

}