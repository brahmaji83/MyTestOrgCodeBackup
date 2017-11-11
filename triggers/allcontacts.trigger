trigger allcontacts on Contact (after insert) {
    public id accid;
    
    for(Account a:[select id, name from account where id in (select accountid from contact where id=:Trigger.New)]){
        accid = a.id;
    }
    List<Contact> con = [select id from contact where accountid=:accid];
    system.debug('no of new contacts'+con.size());

}