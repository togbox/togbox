@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('/Accounts/', '/contacts');
        
 		Account ac = [SELECT Account.Name, (SELECT Contact.Name FROM Account.Contacts) FROM Account where Id =: accountId];
        
       	return ac;
    }   
}