public class AddPrimaryContact implements Queueable {

    private Contact ct;
    private string stateCode;
    public AddPrimaryContact(Contact cont, string state) {
        ct = cont;
        stateCode = state;
    }
    
    public void execute(QueueableContext context) {
        List<Contact> cts = new List<Contact>();
        List<Account> acs = [select id, name from Account where BillingState =: stateCode LIMIT 200];
        for (Account ac : acs) {
            Contact clonedCt = ct.clone(false, false, false, false);
            clonedCt.AccountId = ac.Id;
            cts.add(clonedCt);
        }
        insert cts;     
    }
}