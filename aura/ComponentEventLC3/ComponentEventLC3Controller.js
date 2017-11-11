({
	fireevent : function(component, event, helper) {
		var cevnt = component.getEvent("compevent");
        cevnt.setParams({
            "eventattr" : "This message set in event fire"
        });
        cevnt.fire();
	}
})