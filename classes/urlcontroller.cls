public class urlcontroller {
    public string url {get;set;}
    public id uid {get;set;}
    public urlcontroller(){
        url = ApexPages.currentPage().getUrl();
        uid = ApexPages.currentPage().getparameters().get('id');
    }
    

}