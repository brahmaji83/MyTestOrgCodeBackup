({
	getRecords : function(component, event, helper) {
		var action = component.get("c.getRevRecords");
        action.setParams({
			"recId" : component.get("v.recordId")
		});	
        action.setCallback(this, function(response){
            component.set("v.TestRevs", response.getReturnValue());
        });
        $A.enqueueAction(action);
	}
})