public class SearchContactDemo {

    Public string searchcontact {get;set;}
        public List<Contact> con {get;set;}
          Public PageReference searchcon() {
              con=[select id,firstname,lastname from contact where name=: searchcontact];
              return null;
          }
           
}