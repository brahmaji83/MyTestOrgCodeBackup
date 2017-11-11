({
	doInit : function(component, event, helper) {
        component.set('v.mycolumns', [
                {label: 'Account Name', fieldName: 'Name', type: 'text'},
                {label: 'Industry', fieldName: 'Industry', type: 'text'},
                {label: 'Id', fieldName: 'Id', type: 'text'}
            ]);
        var action = component.get("c.getAccRecords");
        action.setCallback(this, function(response){
            component.set("v.mydata", response.getReturnValue());
            console.log(component.get("v.mydata"));
        });
        $A.enqueueAction(action);		
	},
})