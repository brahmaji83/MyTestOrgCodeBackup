@isTest
public class AccountDeletionTest {
    static testmethod void deleteaccount(){
        
        Account a = new Account();
        a.name = 'Test Account';
        insert a;
        
        Opportunity o = new opportunity();
        o.AccountId=a.Id;
        o.Name='test';
        o.StageName='Prospecting';
        o.CloseDate=date.today();
        insert o;
        try{
        	delete a;     
        }
        catch(system.DmlException e){
            system.assertEquals(statuscode.FIELD_CUSTOM_VALIDATION_EXCEPTION, e.getDmlType(0));
        }
        
    }   
    

}