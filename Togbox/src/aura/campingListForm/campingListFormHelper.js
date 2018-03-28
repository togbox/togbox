({
	createItem : function(component, item) {
		
        //alert(item.Name);
        var addItemEvent = component.getEvent("addItem");
        addItemEvent.setParams({ "item": item });
        addItemEvent.fire();
      
        
       component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false });        
	}
})