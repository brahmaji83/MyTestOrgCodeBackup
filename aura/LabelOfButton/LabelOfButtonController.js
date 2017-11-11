({
	handleClick : function(component, event, helper) {
		var bsource = event.getSource();
        var bname = bsource.get("v.label");
        var bdisabled = bsource.get("v.disabled");
        var bpress = bsource.get("v.press");
        console.log(bname);
        console.log(bpress);
        console.log(bdisabled);
        component.set("v.message", bname);
        component.set("v.bbo", "true");
	},
    
    handleClick2: function(component, event, helper) {
    	var newMessage = event.getSource().get("v.label");
        console.log('called');
    	component.set("v.message", newMessage);
	},

    handleClick3: function(component, event, helper) {
        component.set("v.message", event.getSource().get("v.label"));
    }
})