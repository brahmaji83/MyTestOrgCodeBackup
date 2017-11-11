public class AccountSearchLCController {
    
    @AuraEnabled
    public static List<Account> getAccountList( String searchacc){
        String searchhelp = '%'+searchacc+'%';
        return [select id, name, Industry,Description,Owner.Name from Account where Industry != null and name like : searchhelp];
    }

}