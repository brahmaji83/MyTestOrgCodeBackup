trigger LeadConvertAccountCheck on Lead (before update) {
    Set<String> autoacct = new Set<String>();
    Set<id> convertedacctid = new Set<Id>();
    for(Lead l : Trigger.New){
        if(l.IsConverted){
            autoacct.add(l.Company);
            system.debug('converted id '+l.ConvertedAccountId);
            convertedacctid.add(l.ConvertedAccountId);
            Account acc = [select id, name from Account where id =: l.ConvertedAccountId ];
            system.debug('account '+acc);
        }
    }
    
    system.debug('szie of set '+autoacct.size());
    List<Account> dupacct = [select id from Account where name in: autoacct and id not in: convertedacctid];
    system.debug('list data '+dupacct);
  /*  if(dupacct.size()>0){
        Trigger.New[0].addError('Dupliate account cannot be convreted');
    }
*/
    List<Account> accList = new List<Account>();
    List<Account> delList = [select id from Account where id in: convertedacctid];
    for(Account a: dupacct){
        system.debug('account data '+a);
        a = dupacct[0].clone();
        a.Name = 'Trigger.New[0].Company';
        system.debug('entered for loop');
        accList.add(a);
    }
    insert accList;
    system.debug('acc id '+accList[0].id);
    delete delList;
}