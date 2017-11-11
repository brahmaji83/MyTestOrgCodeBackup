({
	getresult : function(component, event, helper) {
        var fn = component.get("v.FirstNumber");
        var sn = component.get("v.SecondNumber");
        
        var r = fn+sn;
        component.set("v.Result",r);
		
	}
})