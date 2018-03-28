public class AccountProcessor {

    @future
    public static void countContacts(Id[] acIds) {
       	
        /*ALTERNATIVE
      List<Account> lstAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :setId ];
      for( Account acc : lstAccount )
      {
          List<Contact> lstCont = acc.contacts ;
          
          acc.Number_of_Contacts__c = lstCont.size();
      }
      update lstAccount;  
         */
        
        Account[] acs = new Account[]{};
		Map<Id,Integer> contactCounts = new Map<Id, Integer>();
		List<AggregateResult> results = [select account.id, count(id) from contact where account.id in : acIds group by account.id];
		for (AggregateResult res : results){
			contactCounts.put((Id) res.get('Id'),(Integer) res.get('expr0'));    
		}
		acs = [select Id, Number_of_Contacts__c from account where Id in : acIds];
		for (Account ac : acs) {
    		ac.Number_of_Contacts__c = contactCounts.get(ac.Id);
    		//System.debug('Number of contacts at ' + ac.id + ' = ' + ac.Number_of_Contacts__c);
		}
		update acs; 
    }
}