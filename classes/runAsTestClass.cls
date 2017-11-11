@isTest
public class runAsTestClass {

    static testmethod void testrunas(){
        profile p = [select id from profile where name='Standard User'];
        user u = new User(Alias='Brahmak', Email='standarduser@testorg.com', 
				EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
				LocaleSidKey='en_US', ProfileId = p.Id, 
				TimeZoneSidKey='America/Los_Angeles', UserName='standarduserk@testorg.com');
    
    system.runAs(u){
        system.debug('user name '+UserInfo.getLastName());
    }
    }
}