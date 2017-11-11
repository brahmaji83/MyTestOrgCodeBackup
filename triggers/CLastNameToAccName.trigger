trigger CLastNameToAccName on Contact (after update, after insert) {   
    List<Contact> con = new List<Contact>();
    Map<Id, String> m1 = new Map<Id, String>();
    for(contact c:Trigger.New){
        m1.put(c.accountid, c.LastName);
    }
    List<Account> lacc = [select id, name from Account where id in: m1.keySet()];
    List<Account> act = new List<Account>();    
    for(Account a:lacc){
        a.Name = m1.get(a.Id);
        act.add(a);
    }
    update act;
}