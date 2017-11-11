public class AccontSearchLC {
    
    @AuraEnabled
    public static List<Account> searchitcntrlr(String searchstr){
        String sstring = searchstr + '%';
        return [select Id, Name, Industry from Account where name =:searchstr];
    }

}