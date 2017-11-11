@isTest
public class MyControllerTest {

    static testmethod void MCT(){
        Account a = new Account(name='Tests');
        insert a;
        
        apexpages.currentPage().getparameters().put('id',a.Id);
        MyController mct = new MyController();
        
        mct.getAccount();
        a.Name='Test';
        mct.save();  
        system.assertEquals('Test', a.Name);
    }
    
    static testmethod void ContUp(){
        
        Account ac = new Account(name='Test');
        Contact con = new Contact(lastname='Test');
        insert ac;
        con.AccountId=ac.Id;
        con.Email='brahamji83@gmail.com';
        insert con;
        AccountContactrelation act =new AccountContactrelation();
        
    }
}