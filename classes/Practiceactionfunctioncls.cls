public class Practiceactionfunctioncls {
    public string accname {get;set;}


    public void createacc(){
        account a = new account();
        a.Name=accname;
        system.debug('entered inside the function');
        insert a;
        system.debug('accid'+a.id);
    }

}