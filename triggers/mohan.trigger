trigger mohan on Contact (after insert, after update) {   
    String username = userInfo.getFirstName();   
    List<Contact> vcon= new List<Contact>();
    vcon = Trigger.New;
    id conid = vcon[0].id;    
 //   vacc = [select id from account where id in (select accountid from contact where id in :Trigger.New)];
    for(Account acc:[select id from account where id in (select accountid from contact where id in :Trigger.New)]){
        acc.Description='your contacts are last updated by '+username+ 'and the updated contact id is '+conid;
        update acc;
    }
}