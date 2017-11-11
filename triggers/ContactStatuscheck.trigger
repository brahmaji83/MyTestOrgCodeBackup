trigger ContactStatuscheck on Contact (after insert, after update, after delete) {
    public String astatus = 'Success';
    Set<Id> acSet = new Set<Id>();
    List<Contact> con = new List<Contact>();
    List<Account> acc = new List<Account>();
    List<Account> failacc = new List<Account>();
    List<Account> succacc = new List<Account>();
    Set<Account> failcon = new Set<Account>();
    Set<Account> SuccCon = new Set<Account>();
    List<Contact> allcon = Trigger.IsDelete ? Trigger.old : Trigger.New;
    for(contact c:allcon){
        acSet.add(c.accountid);
    }
    List<Account> aclist = [select id, name,ContactStatus__c, (select id, name,Status__c from contacts) 
                            from account where id in: acSet];
    
    for(Account a: aclist){
        for(contact c:a.contacts){
            system.debug('size of list'+a.contacts.size());                         
            if(c.Status__c == 'Fail' || c.Status__c == null){
                a.ContactStatus__c = 'Fail';
                failcoN.add(a);
                system.debug('size of failcon'+failcon.size());
            }            
        }
    }
    
    for(Account a:aclist){
        if(!failcon.contains(a)){
            a.ContactStatus__c = 'Success';
            SuccCon.add(a);
        }
    }
    failacc.addAll(failcon);
    succacc.addAll(SuccCon);
    update failacc;
    update succacc;
}