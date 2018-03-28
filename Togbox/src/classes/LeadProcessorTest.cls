@isTest
private class LeadProcessorTest {

    @testSetup
    static void setupData (){
        
        List<Lead> leads = new List<Lead>();
        for (Integer K=1; K<201;K++) {
            leads.add(new Lead(LastName='Test Lead ' + K, LeadSource = 'NK', Company = 'SPMSD'));
        }
        insert leads;
    }
    
    static testmethod void testLeadProcessor() {
        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();
        
        System.assertEquals(200, [select count() from Lead where LeadSource='Dreamforce']);
    }
}