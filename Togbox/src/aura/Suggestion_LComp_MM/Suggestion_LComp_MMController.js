(
{
doInit : function(component, event, helper) {
    
    var action = component.get("c.getSuggestionCategories");
    var inputsel = component.find("suggestionCategoryList");
    var opts=[];
    action.setCallback(this, function(a) {
        for(var i=0;i< a.getReturnValue().length;i++){
            opts.push({"class": "optionClass", label: a.getReturnValue()[i], value: a.getReturnValue()[i]});
        }
        inputsel.set("v.options", opts);

    });
    $A.enqueueAction(action); 

    //set button states 
    component.set("v.showUpdate", "false");
    component.set("v.showNew", "false");
    component.set("v.showSave", "true");
},
    handleApplicationEvent: function (comp, event) {
        
        var suggestionToShow = event.getParam("suggestion");
        //alert(suggestionToShow.Suggestion_Category__c);
        comp.set("v.suggestion", suggestionToShow);

        //set button states to save any changes
        comp.set("v.showUpdate", "true");
        comp.set("v.showNew", "false");
        comp.set("v.showSave", "false");
    },

    upsert: function(component, suggestion) {

        var action = component.get("c.upsertSuggestion");
        var suggestion = component.get("v.suggestion");
        action.setParams({
            "suggestion": suggestion
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                //TODO: WHAT TO UPDATE - NOT NECESSARY TO UPDATE LIST IF FORM IS ON SEPARATE "PAGE"
                //var suggestion = suggestion.get("v.expenses");
                //expenses.push(response.getReturnValue());
                //component.set("v.expenses", expenses);
                var suggestion = response.getReturnValue();
                component.set("v.suggestion", suggestion);
                alert("Suggestion updated successfully.");
                component.set("v.showUpdate", "false");
            }
        });
        $A.enqueueAction(action);
    }
}
/*
{
    doInit : function(cmp) {
        var opts = [
            { class: "optionClass", label: "Option1", value: "opt1", selected: "true" },
            { class: "optionClass", label: "Option2", value: "opt2" },
            { class: "optionClass", label: "Option3", value: "opt3" }
           
        ];
        cmp.find("suggestionCategoryList").set("v.options", opts);
    }
}		
*/	
)