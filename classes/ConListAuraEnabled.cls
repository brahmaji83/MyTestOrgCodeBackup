public class ConListAuraEnabled {
    @AuraEnabled
    public static List<Contact> getconList(){
        return [select Id, LastName, FirstName, Email from Contact];
    }

}