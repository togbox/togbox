public class AccountHandler {

    public static Account insertNewAccount(string acname) {
        
        try {
        	Account newAccount = new Account(Name=acname);
            insert newAccount;
            System.debug(newAccount.Id);
            return newAccount;
 		}
        catch (DmlException e) {
            System.debug(e.getMessage());
            return null;
        }
    }
}