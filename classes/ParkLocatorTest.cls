@isTest
public class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String strCoun = 'Germany';
        List<String> lstCountry = ParkLocator.country(strCoun);
        // Verify that a fake result is returned
        System.assertEquals(2, lstCountry.size()); 
    }
}