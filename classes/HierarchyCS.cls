public class HierarchyCS {
    FirstHierarchy__c fh = FirstHierarchy__c.getInstance();
    
    public decimal cvalue {get;set;}
    
    public HierarchyCS(){
    	cvalue = fh.Discount__c;
    }
}