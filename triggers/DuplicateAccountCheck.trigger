trigger DuplicateAccountCheck on Account (before insert, before update) {
    
    Set<String> accName = new Set<String>();
    Set<String> accPhone = new Set<String>();
    
    for(Account a:Trigger.new){
        accName.add(a.Name);
        accPhone.add(a.Phone);
    }
    List<Account> acc = [select id from Account where name in : accName and Phone in : accPhone];
    if(acc.size()>0)
    for(Account a:Trigger.new)
    a.addError('Error Fouind');

}