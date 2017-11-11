public class getAccCon {
    public List<Contact> conList {get;set;}
    public Id accId {get;set;}
    
    public void getCon(){
        accId = Apexpages.currentpage().getparameters().get('Id');
        system.debug('accid is '+accId);
        conList = [select id, Name, FirstName, LastName, Email from Contact where accountid = : accId];
    }
}