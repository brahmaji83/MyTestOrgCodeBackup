({
	loadASingleRecord : function(component, event, helper){
        var action = component.get("c.getRec");
        action.setCallback(this, function(response){
            component.set("v.selectedLookUpRecord", response.getReturnValue());
            console.log(response.getReturnValue().Name);
        });
        $A.enqueueAction(action);
    }
})