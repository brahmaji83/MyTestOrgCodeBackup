({
	addthem : function(component, event, helper) {
		var v1 = component.get("v.Inp1");
        var v2 = component.get("v.Inp2");        
        var res = v1+v2;
        component.set("v.result", res);
	}
})