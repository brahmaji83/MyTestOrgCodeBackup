({
	createaccount : function(component, event, helper) {
		var action = component.get("c.createAccountLC");
        var accounts = component.get("v.accounts");
        console.log('called');
        action.setParams({
            acc :accounts
        });
        action.setCallback(this, function(response){
            console.log(response.getState());
            if(response.getState()=='SUCCESS'){
                console.log('entered');
                alert('Succesfully Created');
            }
            if(response.getState()=='ERROR'){
                var errors = response.getError();
                console.log(errors);
                console.log(errors[0].message);
            }
        });	
        $A.enqueueAction(action);
        var appevent = $A.get("e.c:AccountListEvent");
        appevent.fire();
	}
})