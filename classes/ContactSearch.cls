public class ContactSearch {
    public static List<Contact> searchForContacts(string lst, string postcode){
        List<Contact> con = [select id, name from contact where lastname=:lst and MailingPostalCode=:postcode];
        return con;
    }

}