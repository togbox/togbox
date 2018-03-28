@IsTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest() 
    {
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;

        Contact cont = New Contact();
        cont.FirstName ='Tim';
        cont.LastName ='Fox';
        cont.AccountId = a.Id;
        Insert cont;

        cont = New Contact();
        cont.FirstName ='Andy';
        cont.LastName ='Purnell';
        cont.AccountId = a.Id;
        Insert cont;
        
        List<Id> setAccId = new List<Id>();
        setAccId.add(a.id);
 
        Test.startTest();
            AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account ACC = [select Number_of_Contacts__c from Account where id = :a.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(ACC.Number_of_Contacts__c) ,2);
  }
  
}