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
    }
})