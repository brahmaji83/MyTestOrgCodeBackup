@isTest
public class TestRejectDoubleBooking {
	
    static testMethod void TestSingleBooking(){
        DateTime now = System.now();
        
        Speaker__c speak = new Speaker__c();
        speak.Last_Name__c ='Test1';
        speak.First_Name__c ='Test2';
        speak.Email__c = 'test@TEST.COM';
        insert speak;
        
        Session__c session = new Session__c();
        session.Session_Date__c = now;
        session.Name = 'Salesforce';
        session.Level__c='Beginner';        
        insert session;
        
        Session__c session2 = new Session__c();
        session2.Session_Date__c = now;
        session2.Name = 'Siebel';
        session2.Level__c='Beginner';        
        insert session2;
        
        Session_Speaker__c ss1 = new Session_Speaker__c();
        ss1.Session__c = session.Id;
        ss1.Speaker__c = speak.Id;
        insert ss1;
        
        Session_Speaker__c ss2 = new Session_Speaker__c();
        ss2.Session__c = session2.Id;
        ss2.Speaker__c = speak.Id;        
        Database.SaveResult result = Database.insert(ss2, false);        
        system.assert(!result.isSuccess());
    }
}