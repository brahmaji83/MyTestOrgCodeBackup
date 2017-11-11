trigger UpdateAccountOwner on Account (before insert, after insert, after update) {
    
    List<Account> accAnn = new List<Account>();
    List<AccountTeamMember> atmList = new List<AccountTeamMember>();
    Map<String, Id> accMap = new Map<String, Id>();    
      
    if(Trigger.IsInsert && Trigger.IsBefore)
    {        
        system.debug('entered before');        
        for(Account a: Trigger.New){
            a.OwnerId = '00528000002Oelf';
            system.debug('acc amp id'+accmap.get(a.Industry));
            a.Ownership = 'Public';            
        }
    }
    
    if(Trigger.IsInsert && Trigger.IsAfter)
    {
        List<User> userlist = [select id, Name from user where Username = 'rapola.mohan@gmail.com'];
       // Id userid = [select id, Name from user where Username = 'rapola.mohan@gmail.com'][0].Id;
        for(Account a : Trigger.New){        
            if(a.AnnualRevenue > 10000){
                accAnn.add(a);
            }
            //This map is used to get the id by user name
            for(user u: userlist){
                accMap.put(a.Industry, u.Id);
            }
        } 
        if(accAnn.size()>0){
            for(Account a: accAnn){
                system.debug('accann not entered');
                AccountTeamMember atm = new AccountTeamMember();
                atm.AccountId = a.Id;
                atm.AccountAccessLevel = 'Read';
                atm.UserId = accmap.get(a.Industry);
                atm.TeamMemberRole = 'Account Manager';
                atmList.add(atm);
                system.debug('size of atmlist'+atmlist.size());
            }
            insert atmList;
        }
    }
    
    if(Trigger.IsUpdate && Trigger.IsAfter)
    {
        List<Account> accWithCon = [select id, Phone, (select id, OtherPhone, MobilePhone from Contacts) 
                                    from Account 
                                    where id in: Trigger.New ];
        List<Contact> conUpd = new List<Contact>();
        system.debug('entered i update');
        for(Account aone : accWithCon){
            for(Account atwo: Trigger.old){            
                for(Contact c: aone.contacts){
                    c.OtherPhone = atwo.phone;
                    c.MobilePhone = aone.Phone;
                    conUpd.add(c);
                }
            }
        }
        if(conUpd.size() > 0)
        update conUpd;
    }              
}