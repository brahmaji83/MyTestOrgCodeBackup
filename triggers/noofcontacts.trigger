trigger noofcontacts on Contact (after insert, after update, before delete, after undelete) {
    List<Contact> con = new List<Contact>();
    List<Account> acts = new List<Account>();
    List<Account> acts2  =new List<Account>();
    List<Id> ids = new List<Id>();
    if(Trigger.isinsert){
    acts = [select id from account where id in (select accountid from contact where id in :Trigger.New)];    
    }
    
    if(Trigger.isdelete){
    acts = [select id from account where id in (select accountid from contact where id in :Trigger.old)];    
    }
    integer i=0;
    for(Account acc: acts){
        acts2.add(acc);
    }
    List<Contact> cons = [select id from contact where accountid in :acts2];
    system.debug('count'+cons.size());
    for(Contact c:cons){
        i = i+1;
    }
    system.debug('total'+i);
    for(Account acss:acts){
        acss.NumberofLocations__c = i;
        update acss;
    }
    
}