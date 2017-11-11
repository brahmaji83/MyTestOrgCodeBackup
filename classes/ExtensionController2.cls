public class ExtensionController2 {
    public Account acc {get;set;}
    public ExtensionController2(ApexPages.StandardController controller){
        this.acc = (Account) controller.getRecord();
    }
    
    public String getaName(){
        return [select name from Account where id =: ApexPages.currentPage().getparameters().get('Id')].Name;
    }

}