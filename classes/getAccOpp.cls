public class getAccOpp {
    public List<Opportunity> oppList {get;set;}
    public Id accId {get;set;}
    
    public void getOpp(){
        accId = Apexpages.currentpage().getparameters().get('Id');
        system.debug('accid is '+accId);
        oppList = [select id, Name, Amount from Opportunity where accountid = : accId];
    }

}