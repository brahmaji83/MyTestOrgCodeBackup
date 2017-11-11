public class CreateaCase {
    public string sCaseSubject {get;set;}
    public string sCaseDescription {get;set;}
    public string sCaseStatus {get;set;}
    public string sCasePriority {get;set;}
    public string sCaseOrigin {get;set;}
    public List<Case> lcase {get;set;}
    public case ccase {get;set;}
    
    public CreateaCase(){
        ccase = new Case();
    }
    public pagereference saveit(){
		ccase.Subject = sCaseSubject;
        ccase.Description = sCaseDescription;
        ccase.Status = sCaseStatus;
        ccase.Priority = sCasePriority;
        ccase.Origin = sCaseOrigin;
        insert ccase;
        
        return new PageReference('/apex/CaseAcknowledgement?id='+ccase.Id);        
    }
    public pagereference Caselist(){
        Id cid = ApexPages.currentPage().getParameters().get('id');
        system.debug('It is called');
        lcase = [select subject, Description,Status,Priority,Origin,CaseNumber  from case where id=: cid];
        return null;
    }
    
    public pagereference cancel(){
        return new PageReference('/apex/CaseCreation');        
    }
    
    
}