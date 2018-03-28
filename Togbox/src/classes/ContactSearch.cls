public class ContactSearch {

    public static List<Contact> searchForContacts(string lastName, string postcode) {
        
        List<Contact> foundContacts = [select lastname, mailingpostalcode from contact where lastname =: lastName and mailingpostalcode =: postcode];
        if (foundContacts.size() < 1) {
            return null;
        }
        else {
            return foundContacts;
        }
    }
}