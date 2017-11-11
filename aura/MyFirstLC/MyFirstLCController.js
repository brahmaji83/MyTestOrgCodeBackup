({
	doSum : function(component, event, helper) {
		var fnumber = component.find("fnid");
        var fvalue = fnumber.get("v.value");
        var snumber = component.find("snid");
        var svalue = snumber.get("v.value");
        
        var res = fvalue + svalue;
        component.set("v.result", res);
        
	},
    doMultiply : function(component, event, helper) {
        console.log('entered multiply block');
        var fnumber = component.find("fnid");
        var fvalue = fnumber.get("v.value");
        var snumber = component.find("snid");
        var svalue = snumber.get("v.value");
        var res = fvalue * svalue;
        component.set("v.result", res);
    }
})