({
	handleEventinCE1 : function(component, event, helper) {
        var evnt = event.getName();
        var evntattr = event.getParam("eventattr");
        component.set("v.cattr1", evntattr);
		console.log('attribute is set');
	}
})