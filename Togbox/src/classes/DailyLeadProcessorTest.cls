@isTest
public class DailyLeadProcessorTest {

    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static testmethod void testScheduledJob() {

        // Create some out of date Opportunity records
        List<Lead> lds = new List<Lead>();
        for (Integer i=0; i<200; i++) {
 			lds.add(new Lead(Lastname='Lead ' + i, Firstname='Test', Company='Company '+i));
        }
        insert lds;
       
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        // Verify the scheduled job has not run yet.
        lds = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(0, lds.size(), 'Leads updated before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        lds = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, lds.size(), 'Leads were not updated');

    }
}