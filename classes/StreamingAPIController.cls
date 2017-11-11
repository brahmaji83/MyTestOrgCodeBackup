public class StreamingAPIController {        
    public StreamingAPIController() {
    }
    
    public List<Account> getlistAccount() {
        return [SELECT Id, Name,industry FROM Account where industry='Banking'];
    }
    
    public PageReference refresh() {
        getlistAccount();
        return null;
    }
}