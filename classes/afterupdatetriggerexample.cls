public class afterupdatetriggerexample {
    public static void beforeupdate(List<Account> accs){
        for(Account a:accs){
            if(a.industry=='Banking'){
               // a.addError('Banking records cannot be modified');
            }
        }
    }

}