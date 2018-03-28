@isTest
public class AddPrimaryContactTest {

    @testSetup
    static void setUp() {
        
        List<account> acs = new List<Account>();
        for (Integer J=0;J<50;J++) {
            acs.add(new Account(Name='NY Test Account '+J,BillingState='NY'));
        }
       	for (Integer K=0;K<50;K++) {
            acs.add(new Account(Name='CA Test Account '+K,BillingState='CA'));
        } 
        insert acs;
    }
    
    static testmethod void testAddPrimaryContact() {
        
        Contact newCt = new Contact(Lastname='Contact', Firstname='Primary');
        AddPrimaryContact apc = new AddPrimaryContact(newCt, 'CA');
        Test.startTest();
       	System.enqueueJob(apc);
        Test.stopTest(); 
        System.assertEquals(50,[select count() from Contact where Account.BillingState='CA']);
    }
}