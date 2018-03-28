@isTest
private class TestRestrictContactByName {

    @isTest static void TestContactDeletion() {
    	
    	Contact validCont = new Contact(LastName='VALIDNAME', FirstName='Anything');
    	
    	Test.startTest();
        Database.SaveResult result = Database.insert(validCont, false);
  
    	System.assert(result.isSuccess());  
        
        Contact invalidCont = new Contact(LastName='INVALIDNAME', FirstName='Anything');
       
        result = Database.insert(invalidCont, false);
        Test.stopTest();

    	System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());    
    	

}
}