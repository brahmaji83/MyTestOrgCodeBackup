public class SearchAContact_Controller {
    public String conlastname {get;set;}
    public List<Contact> conList {get;set;}
    public pagereference conSearch(){
        String refconlastname = '%'+conlastname+'%';
        conList = [select id, lastname, firstname, email from contact where lastname like : refconlastname];
        return null;
    }

}