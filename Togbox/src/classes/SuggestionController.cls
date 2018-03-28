public with sharing class SuggestionController {

	@AuraEnabled
	public static List<String> getSuggestionCategories(){
		List<String> options = new List<String>();
		Schema.DescribeFieldResult fieldResult = Suggestion__c.Suggestion_Category__c.getDescribe();
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
			for (Schema.PicklistEntry f: ple) {
		    options.add(f.getLabel());
		}
		return options;
	}
    
	@AuraEnabled
	public static List<Suggestion__c> getSuggestions(){
        List<Suggestion__c> suggestions = [SELECT Id, Name, Suggestion_Description__c, Suggestion_Category__c, CreatedDate FROM Suggestion__c];
		return suggestions;
	}

	@AuraEnabled
	public static Suggestion__c upsertSuggestion(Suggestion__c suggestion){
		// Perform isUpdatable() checking first, then
        upsert suggestion;
        return suggestion;
	}
}