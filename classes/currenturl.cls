public class currenturl {
    
    public string url {get;set;}
    
    public currenturl(){
        url=ApexPages.currentPage().getUrl();
        
    }

}