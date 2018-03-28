@isTest
private class ParkLocatorTest {

       @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
		string country = 'Germany';
        string[] result = ParkLocator.country(country);
        // Verify that a fake result is returned
           string[] assertValue = new string[]{'Hyde Park', 'St James\' Park'};
        System.assertEquals(assertValue, result); 
       }
}