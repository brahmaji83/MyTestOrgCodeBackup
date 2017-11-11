public class LeadPageViewCounter {
    public Lead lead{get;set;}
    public user u{get;set;}
    public decimal count;
    public LeadPageViewCounter(ApexPages.StandardController controller) {
    }
    public pagereference updatecount(){
        lead=[SELECT Id, pagecount__c FROM Lead WHERE Id =:ApexPages.currentPage().getParameters().get('Id')];
        u=  [select name from user where id= :UserInfo.getUserId()];
        if(lead.pagecount__c==null) {
            lead.pagecount__c=1;
            lead.Last_Viewed_By__c=u.name;
        }
        else{
            lead.pagecount__c+=1;
            lead.Last_Viewed_By__c=u.name;
        }
        update lead;
        return null;
    }
}