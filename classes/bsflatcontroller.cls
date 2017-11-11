public class bsflatcontroller {
    public List<String> vallist {get;set;}
    public String jsonexpr {get;set;}
    public Opportunity oppty {get;set;}
    
    public bsflatcontroller(){
        Id sId = ApexPages.currentPage().getParameters().get('Id');
        oppty = [select id, stagename from Opportunity where id=: sid];
    }
    public pagereference getCountries()
    {
        List<SelectOption> options = new List<SelectOption>();
        vallist = new List<String>();
        Schema.DescribeFieldResult fieldResult =
            Opportunity.StageName.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
        for( Schema.PicklistEntry f : ple)
        {
            options.add(new SelectOption(f.getLabel(), f.getValue()));
            vallist.add(f.getValue());
        }    
        jsonexpr = JSON.serialize(vallist);
        return null;
    }
    
    
    public pagereference saverecord(){
        
        update oppty;
        return null;
    }
    
}