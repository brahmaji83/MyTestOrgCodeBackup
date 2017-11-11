({
	toggle : function(component, event, helper) {
        var toggleText = component.find("text");
        var toggleButton = component.find("button");
        console.log("before toggleClass");
        $A.util.toggleClass(toggleText, "toggle");
        $A.util.toggleClass(toggleButton, "toggle");
		console.log("after toggleClass");
        console.log(event.getSource().getLocalId()); // To get the id of the button
	}
})