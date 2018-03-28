public class SuggestionEmailTemplateController {

    public Id suggestionId {get;set;}
    //public string suggestionLink {get;set;}
    
    public string getsuggestionLink() {
        
        string baseURL = URL.getSalesforceBaseUrl().toExternalForm();
        
        if (suggestionId == null) {
            return baseURL;
        }
        else {
            return baseURL + '/' + Id.valueOf(suggestionId);
        }        
    }
}