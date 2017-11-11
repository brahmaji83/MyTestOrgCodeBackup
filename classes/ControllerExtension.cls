public class ControllerExtension {
    private final account acct ;
    public controllerextension(Apexpages.StandardController std){
        this.acct = (Account)std.getRecord();
        system.debug('Account id'+acct);
    }
	
    public string getGreeting(){
        return 'Hello'+ acct.name;
    }
}