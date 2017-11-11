({
	doInit : function(component, event, helper) {
		var action = component.get("c.getFieldLabels");
        var childObj = [];
        childObj = component.get("v.childObjects").split(',');
        
        action.setParams({
            myObjectName : component.get("v.sObjectName"),
            lstChildObjects : childObj
            
        });
        action.setCallback(this, function(response){
            component.set("v.fieldwrap", response.getReturnValue());
        });
        
        $A.enqueueAction(action);
	},
    
    fetchthedata : function(component, event){
        console.log('called');
        var val = event.currentTarget.getAttribute( 'data-index' );
        console.log(val);
    }
})