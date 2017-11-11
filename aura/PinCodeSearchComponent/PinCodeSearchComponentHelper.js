({
	getPinCodeData : function(component, event) {
        var action = component.get("c.searchData");
        action.setParams({
            strPinCode : component.find("searchInpId").get("v.value")
        });
        action.setCallback(this, function(response){
            if(response.getState() === 'SUCCESS'){
                component.set("v.objList", response.getReturnValue());
                console.log(response.getReturnValue());                
            }
        });
        $A.enqueueAction(action);		
	}
})