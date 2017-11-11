({
    createCampItem : function(component, event, helper) {
        var validExpense = true;
        var nameField = component.find("campName");
        var campName = nameField.get("v.value");
        console.log(campName);
        if ($A.util.isEmpty(campName)){
            validExpense = false;
            nameField.set("v.errors", [{message:"Camp name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
        
        if(validExpense){
            var newExpense = component.get("v.newItem");            
            var theExpenses = component.get("v.items");
            helper.createItem(component, newExpense);
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
    },
    
    doInit : function(component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            component.set("v.items", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    handleAddItem : function(component, event, helper){
        var action = component.get("c.saveItem");
        var campitemhelper = event.getParam("item");        
        
        console.log(campitemhelper);
        action.setParams({"campitem" : campitemhelper});
        action.setCallback(this, function(response){
            var campItems = component.get("v.items");
            campItems.push(response.getReturnValue());
            component.set("v.items", campItems);
        });
	
        $A.enqueueAction(action);
    }
})