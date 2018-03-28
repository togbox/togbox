public class SuggestionAttachFile {
    
    public Attachment suggestionAttachment {get;set;}
    public Suggestion__c newSuggestion {get;set;}
    
    public SuggestionAttachFile(){
        suggestionAttachment = new Attachment();
        newSuggestion = new Suggestion__c();
    }
    
    public PageReference saveSuggestion(){
        
        insert newSuggestion;
        if (suggestionAttachment.Name != null) {
        	suggestionAttachment.ParentId = newSuggestion.Id;
        	insert suggestionAttachment;
        }
       	PageReference suggestionPage = new PageReference('/' + newSuggestion.Id);
        suggestionPage.setRedirect(true);
        return suggestionPage;
    }
}