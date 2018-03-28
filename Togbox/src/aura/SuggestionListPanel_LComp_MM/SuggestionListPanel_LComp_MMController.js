({
	edit : function(component, event, helper) {
        // Get the application event by using the
        // e.<namespace>.<event> syntax
        var appEvent = $A.get("e.c:displaySuggestionForEdit");
        appEvent.setParams({
            "suggestion" : component.get("v.suggestion") });
        appEvent.fire();	
	}
	,
	navigateToEdit : function(component, event, helper) {
    var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef: "c:Suggestion_LComp_MM",
            componentAttributes: {
                "suggestion": component.get("v.suggestion")
            }
        });
    evt.fire();    
}
})