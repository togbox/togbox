@isTest
public class AccountManagerTest {

        @isTest static void testGetAccountById() {
        Id accountId = createTestRecord('Andy');
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://eu6.salesforce.com/services/apexrest/Accounts/'
            + accountId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('Test account for Trailhead Andy', thisAccount.Name);
    }

   // Helper method
    public static Id createTestRecord(String suffix) {
        // Create test record
        Account accountTest = new Account(
            Name='Test account for Trailhead ' + suffix);
        
        insert accountTest;
        Contact cont;
        for (integer k=0; k<3; k++){
            cont = new Contact(Lastname='Test contact for Trailhead '+suffix,AccountId=accountTest.Id);
            insert cont;   
        }
        return accountTest.Id;
    }          

}