({
	handleEventinCE2 : function(component, event, helper) {
        var evnt = event.getName();
        var evntattr = event.getParam("eventattr");
        component.set("v.cattr2", evntattr);
		console.log('attribute is set 2');
        event.stopPropagation();
	}
})