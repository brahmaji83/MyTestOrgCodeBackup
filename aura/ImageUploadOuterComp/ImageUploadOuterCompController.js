({
    CheckAnyPrimary : function(component, event, helper) {
    	var action = component.get("c.checkPrimaryImage");  
        action.setParams({
            parentId : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            if(response.getState() == 'SUCCESS'){
                console.log(response.getReturnValue());
                if(response.getReturnValue() == true){
                	component.set("v.primaryExist", true);    
                }                
            }else{
                console.log('something is wrong');
            }
        });
        $A.enqueueAction(action);
    },
	addRow : function(component, event, helper) {
        var cmpNumber = component.get("v.generateCompNumber");
        cmpNumber = cmpNumber + 1;
        component.set("v.generateCompNumber", cmpNumber);
		helper.addMoreFile(component, event, cmpNumber);
	},
    callInnerCompEvent : function(component, event, helper) {
        var spinner = component.find("mySpinner");
		$A.util.toggleClass(spinner, "slds-hide");
        
        helper.uploadImages(component, event);
    },
    
    handleSuccessEvent : function(component, event, helper) {
        console.log(event);
        console.log('child id '+event.getParam('childGlobalIds'));
        
        var incrementSuccess = component.get("v.successUpload") + 1;
    	component.set("v.successUpload", incrementSuccess);
        if(incrementSuccess == component.get("v.body").length){
            var spinner = component.find("mySpinner");
			$A.util.toggleClass(spinner, "slds-hide");
            var navEvt = $A.get("e.force:navigateToSObject");
            navEvt.setParams({
                "recordId": component.get("v.recordId"),
                "slideDevName": "detail"
            });
            navEvt.fire();
        }
    },
})