({
    createItem : function(component, newItem) {
        var createEvent = component.getEvent("addItem");
        var newItem = component.get("v.newItem");
        createEvent.setParams({ "item": newItem });
        createEvent.fire();
        console.log('event fired');
        
        var newExpense = component.get("v.newItem");            
        var theExpenses = component.get("v.items");
        theExpenses.push(newExpense);
        component.set("v.items", theExpenses);
        console.log(theExpenses.length);
        component.set(
            "v.newItem", {'sobjectType': 'Camping_Item__c', 
                          'Quantity__c' : 0, 
                          'Price__c' : 0,
                          'Name':''
                         }
        );
    }
})