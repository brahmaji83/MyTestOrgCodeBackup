public class JSRemoting_Acc_Creation {
    
    @RemoteAction
    public static Account createanewaccount(string accname){
        account acc = new Account(name=accname);
        insert acc;
        return acc;
    }

}