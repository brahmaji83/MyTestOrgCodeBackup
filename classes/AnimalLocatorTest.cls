@isTest
public class AnimalLocatorTest {
    
    static  testMethod void trailheadTest(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        String str = AnimalLocator.getAnimalNameById(1);       
        
    }
}