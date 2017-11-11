({
    init: function (component, event, helper) {
    //    alert('in Init'); 
        helper.startListening(component, event, helper);
    },
    
    buttonClicked : function (component, event, helper) {
        var createRecordEvent = $A.get("e.force:createRecord");
        createRecordEvent.setParams({
            "entityApiName": "Account"
        });
        createRecordEvent.fire();
    },
    handleShowNotificationEvent: function (component, event, helper) {
     //   alert('In Controller');
        helper.handleShowNotificationEvent(component, event, helper);
    }
})