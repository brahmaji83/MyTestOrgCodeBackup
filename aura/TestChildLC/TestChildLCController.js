({
	myAction : function(component, event, helper) {
		$A.enqueueAction(component.get("c.callServerMethod"));
	}
})