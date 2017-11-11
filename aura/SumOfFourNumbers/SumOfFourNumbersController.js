({
	addnumbers : function(component, event, helper) {
		var i1 = component.get("v.Inp1");
        console.log('first number'+i1);
        var i2 = component.get("v.Inp2");
        console.log(i2);       
        var i3 = component.get("v.Inp3");
        console.log(i3);
        var i4 = component.get("v.Inp4");
        console.log(i4);
        
        var res = i1+i2+i3+i4;
        
        component.set("v.result", res);
	}
    
    
})