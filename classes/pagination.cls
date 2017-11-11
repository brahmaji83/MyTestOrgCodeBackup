public class pagination {
    public integer size {get;set;}
    public integer noofrecords{get;set;}
    public List<SelectOption> pselect {get;set;}
    
    public pagination(){
        size = 10;
        pselect = new List<selectOption>();
        pselect.add(new selectoption('5','5'));
        pselect.add(new selectoption('10','10'));
        pselect.add(new selectOption('15','15'));
        pselect.add(new selectOption('20','20'));
        pselect.add(new selectOption('25','25'));        
    }
    
    public Apexpages.StandardSetController setcon{
        get {
            if(setcon == null){
                setcon = new Apexpages.StandardSetController(Database.getQueryLocator([select id, name, amount,stagename from opportunity])) ;
                setcon.setPageSize(size);
                noofrecords = setcon.getResultSize();
            }
            return setcon;
        }
        set;
    }
        
    public List<Opportunity> getOpportunities(){
        return(List<Opportunity>) setcon.getRecords();
    }
    
    public pagereference refreshpage(){
        setCon.setPageSize(size);
        return null;
    }

}