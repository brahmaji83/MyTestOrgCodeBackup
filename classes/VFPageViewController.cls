public class VFPageViewController {
    
    public void updatepagecount(){
        PageView__c p = [select Pagecount__c from PageView__c limit 1];
        p.Pagecount__c +=1;
        update p;
    }

}