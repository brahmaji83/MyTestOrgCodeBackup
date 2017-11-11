({
	searchaccounts : function(component, event) {
        console.log('helper entered');
        var accname = component.get("v.searchstring");
        console.log(accname);
        var action = component.get("c.getAccountList");
        action.setParams({
            'searchacc' : accname
        });
        action.setCallback(this, function(response){
            var estate = response.getState();
            if(estate == 'SUCCESS'){
                component.set("v.AccountList", response.getReturnValue());
            }
            console.log(response.length);
            var reccount = component.get("v.AccountList");
            component.set("v.recordcount", response.getReturnValue().length);
        });
        $A.enqueueAction(action);
	}
})