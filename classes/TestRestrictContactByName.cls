@isTest
private class TestRestrictContactByName {
    @isTest static void TestRest(){
        Contact con = new Contact(lastname='INVALIDNAME');
        insert con;
		        
        Test.startTest();
        database.SaveResult sr = database.insert(con, false);
        Test.stopTest();
        
        system.assert(!sr.isSuccess());
        System.assert(sr.getErrors().size() > 0);        
        system.debug(sr.getErrors()[0].getMessage());
		System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             sr.getErrors()[0].getMessage());
    }
}