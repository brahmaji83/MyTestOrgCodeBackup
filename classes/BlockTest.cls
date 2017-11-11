@isTest
public class BlockTest {
    static testmethod void bt(){
        Block b = new Block();
        Account a =new Account();
        a.Name='TestAccount';
        a.Type='Customer - Direct';
        List<Account> la1= new List<Account>();
        la1.add(a);
        insert la1;
        
        Account ac =new Account();
        ac.Name='TestAccount2';
        ac.Type='Customer - Channel';
        List<Account> la2 = new List<Account>();
        la2.add(ac);
        insert la2;
        
        b.B2=false;
        b.getaccts();
        b.Prospect();
        b.Customer();
        
    }
}