public class RandomContactFactory {

     static public List<Contact> generateRandomContacts(integer num, string lastname) {
        
        List<Contact> conts = new List<Contact>();
        for (integer i=0; i<num;i++) {
            conts.add(new Contact(LastName=lastname, FirstName = 'Firstname' + String.valueOf(i)));
        }
        return conts;
    }
}