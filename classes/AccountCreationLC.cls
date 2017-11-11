public class AccountCreationLC {
    
    @AuraEnabled
    public static Account createAccountLC(Account acc){
        system.debug('enter');
        insert acc;
        return acc;
    }
    
    @AuraEnabled
    public static List<Account> accList(){
        return [select id, Name, Industry from Account order by createddate desc];
    }

}