public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads (string searchTerm) {
        
        List<List<sObject>> results = [FIND :searchTerm RETURNING Contact(FirstName, LastName where FirstName = :searchTerm or LastName = :searchTerm),Lead (FirstName, LastName where FirstName = :searchTerm or LastName = :searchTerm)];
        System.debug(String.valueOf(results[0].size()));
        System.debug(String.valueOf(results[1].size()));
        return results;
    }
}