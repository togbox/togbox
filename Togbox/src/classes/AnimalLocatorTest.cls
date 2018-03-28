@isTest
public class AnimalLocatorTest {

     @isTest static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        string animalName = AnimalLocator.getAnimalNameById(1);
        // Verify that the response received contains fake values
        System.assertEquals(animalName, 'chicken');
	}
}