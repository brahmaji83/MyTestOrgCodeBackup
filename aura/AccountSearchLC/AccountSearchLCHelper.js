({
	searchhelper : function(component, event) {
        var action = component.get("c.searchitcntrlr");
        //var accn = component.get("v.accname");
        console.log('entered helper 1');
        
        action.setParams({
            'searchstr' : component.get("v.searchstring")
        });
        console.log('entered helper 2');
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log('entered helper 3');
            var storeResponse = response.getReturnValue();
            if(state == 'SUCCESS'){
                component.set("v.searchresult", storeResponse);
            }
            
        });
        console.log('entered helper 4');
        $A.enqueueAction(action);		
	}
})