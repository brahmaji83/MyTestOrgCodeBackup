public class AccountHandler {
    public static Account insertNewAccount(String aname){
        try{
            Account acc = new Account();
            acc.name=aname;
            insert acc;
            system.debug('test: '+acc.id);
            return acc;
        }
        catch(DMLexception e){
            return null;
        }  
        
    }

}