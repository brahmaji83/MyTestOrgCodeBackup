public class extension1 {

    public string greeting {get;set;}
	private final account acct ;

    public extension1(ApexPages.StandardController controller){
        this.acct = (Account)controller.getRecord();
        greeting = 'Hellow Brahma';
    
    }
    
    public pagereference save(){
		system.debug('entered to pr');
        
        return null;
    }
    
}