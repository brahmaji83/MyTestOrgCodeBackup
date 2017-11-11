public class onloadcontroller {




    public List<testobject__c> code {get;set;}
    public decimal t;

    public onloadcontroller ()
    {
        Map<String,testobject__c> allCodes = testobject__c.getAll();
        code = allCodes.values();
        
       
    }  
    
    public PageReference onload() {
        Map<String,testobject__c> allCodes = testobject__c.getAll();
        code = allCodes.values();   
        return null;
    }
}