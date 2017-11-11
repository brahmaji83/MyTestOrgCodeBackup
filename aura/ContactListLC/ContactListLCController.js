({
	takecontacts : function(component, event, helper) {
		var action = component.get("c.getconList");
        action.setCallback(this, function(response){
            component.set("v.conlist", response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})