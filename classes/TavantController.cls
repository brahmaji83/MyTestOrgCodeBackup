public class TavantController {
    public decimal pagecount {get;set;}
    public decimal counter {get;set;}
    public PageView__c pv;
    Org_Settings__c	csettings = Org_Settings__c.getInstance('cnt');
    public TavantController(){
        //pv.Pagecount__c += 1;        
        pv = [select id, Pagecount__c from PageView__c limit 1];
    }
    public void updatepagecount(){
		system.debug('sf'+csettings.Tavant__c);
        pv.Pagecount__c +=1;        
        system.debug('counter ' +pv.Pagecount__c);        
        update pv;        
        pagecount = pv.Pagecount__c;        
    }
    
}