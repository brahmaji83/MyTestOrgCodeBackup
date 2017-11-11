public class MyContactListController {
	@AuraEnabled
    public static List<Contact> getContacts(){
        return [select Id, Name, Email, FirstName, LastName from Contact];
    }
}