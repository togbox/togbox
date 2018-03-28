public with sharing class SuggestionsController {

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
}