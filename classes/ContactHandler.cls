public with sharing class ContactHandler {


  public static void beforetrigger(List<Contact> connew){
      Map<String, Contact> conmap = new Map<String, Contact>();
      for(Contact c: connew){
        if((c.email != null)){
            if(conmap.containsKey(c.email)){
                c.email.addError('some error from Trigger - ContactHandler');
              }else{
                  conmap.put(c.email, c);
              }
        }
      }

      for(contact con : [select id, email from contact where email in: conmap.keyset()]){
        system.debug('entered in for loop'+con.email);
        Trigger.new[0].addError('bad');
      }

  }
}