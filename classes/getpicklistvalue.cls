public class getpicklistvalue {
    public List<SelectOption> picklistvalues {get;set;}
    public String selectedvalue {get;set;}
    public getpicklistvalue(){
        picklistvalues = new List<SelectOption>();
        picklistvalues.add(new selectOption('A', 'Aid'));
        picklistvalues.add(new selectOption('B', 'Bid'));
        picklistvalues.add(new selectOption('C', 'Cid'));
    }
    
    public pagereference selectedpickvalue(){
        system.debug(selectedvalue);
        return null;
    }
}