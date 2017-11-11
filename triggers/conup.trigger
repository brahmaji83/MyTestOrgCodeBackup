trigger conup on Contact (after insert) {
    List<Contact> cons = [select accountid,id, lastname from contact where id in :Trigger.New]; 
    List<Contact> accon = new List<Contact>();
    List<Account> acc = [select name from account where id in (select accountid from contact where id in:Trigger.New)];
    for(Contact ac:cons){        
        ac.firstname=acc.get(0).name;
        accon.add(ac);
        system.debug('result'+acc.get(0).name);        
    }
    update accon;
}