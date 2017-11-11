({
    doInit : function(component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            component.set("v.items", response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    submitForm : function(component, event, helper){
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
            helper.createItem(component, null);

        }
    }
})