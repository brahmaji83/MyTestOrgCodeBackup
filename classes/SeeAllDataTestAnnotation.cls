@isTest
public class SeeAllDataTestAnnotation {

    static testmethod void test1(){
        Integer a = [select Id from Account].size();
        Integer ausers = [select Id from User].size();
        
        system.debug('no of accounts' + a);
        system.debug('no of users' + ausers);
        system.assertEquals(0, a);
        system.assertEquals(9, ausers);
    }
    
    @isTest(SeeAllData=true)
    static void test2(){
        List<Account> a = [select Id from Account];
        Account acc = [select id, Name from Account limit 1];
        acc.Name = 'TestName';
        update acc;
        system.assertEquals('TestName', acc.Name);
        system.debug('no of accounts' + a.size());
        system.assertEquals(164, a.size());
    }
    
    //To load data from static resource
   	
    @isTest
    static void test3(){
        List<sObject> ls = test.loadData(Account.sobjectType, 'TestData');
        system.debug('size of ls'+ls.size());
		system.assert(ls.size()==1);
        system.debug('ls size'+ls.size());
    }
    
    
}