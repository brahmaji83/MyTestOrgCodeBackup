public class testcase {
    public Case caseob {get;set;}
    public id caseid {get;set;}
    public pagereference save(){
      //  case = new case();
      	List<Contact> cons = [select id, accountid from contact where email=:caseob.SuppliedEmail order by createddate desc];
        system.debug('Count'+cons.size());
        if(cons.size()>=1)
        {
            caseob.ContactId = cons.get(0).id;
            caseob.AccountId = cons.get(0).accountid;
            insert caseob;
            case cs = [select id from case where id=:caseob.id];
            caseid = cs.Id;
            pagereference pr = new pagereference('/apex/testcasethank?id='+caseid);
            return pr; 
        }
        else{
            ApexPages.Message msg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Please enter an email that matches our records');
            apexpages.addMessage(msg);
            return null;
        }
    }
    public testcase(){
        caseob = new case(); 
    }

}