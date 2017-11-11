@isTest
public class TestSetUpExample {
	@testSetUp
    static void test1(){
        List<Account> accList = new List<Account>();
        for(integer i=0;i<2;i++){
            accList.add(new Account(Name='Test Account '+i));
        }
        insert accList;
    }
    
    @isTest
    static void test2(){
        List<Account> acc = new List<Account>();
        acc = [select Id from Account];
        system.debug('size of acc list '+acc.size());
    }
}