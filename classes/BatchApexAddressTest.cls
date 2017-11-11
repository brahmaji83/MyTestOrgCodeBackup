@isTest
public class BatchApexAddressTest {

    static testmethod void batchapextest1(){
        Address__c ad = new Address__c();
        Account ac = new Account();
        ac.name='BatchAccount';
        ac.Type='Prospect';
        insert ac;
        ad.Street_Name__c='Batcvhstreet';
        ad.Postal_Code__c=123;
        ad.City__c='Bangalore';
        ad.Country__c='India';
        ad.Account__c=ac.Id;
        insert ad;
        
        Address__c query = [select id, name from Address__c where id=:ad.Id];
        BatchApexAddress baa = new BatchApexAddress();
        test.startTest();
        database.executeBatch(baa,20);
        test.stopTest();
        
    }
}