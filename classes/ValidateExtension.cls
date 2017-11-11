public class ValidateExtension {
    public boolean check;
    public final account acct;
    public string acc;
    public ValidateExtension(ApexPages.StandardController std){
        this.acct = (Account)std.getRecord();   
        system.debug('Acc id'+acct.Id);               
        Validate();
    }
    public void Validate(){
        List<Account> accs = [select id,name from account where id=:acct.Id];
        for(Account a: accs){
            acc = a.name;
        }
        try{
            if(acc == 'Brahmaji'){
                system.debug('Success');
            }
            else{
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING,'Account name is not correct'));
            }
        }
        catch(exception e){
            ApexPages.addMessages(e);
            
        }
    }

}