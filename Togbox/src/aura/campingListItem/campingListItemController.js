({
	packItem : function(component, event, helper) {
        
        var i = component.get("v.item");
        i.Packed__c = true;
        component.set("v.item",i);
		//component.set("v.disabled", true);	
	}
})