({
    createRecord : function (component, event, helper) {
        component.set("v.isOpen", true);
        var action = component.get("c.getRecTypeId");
        var recvalue = component.find("selectid").get("v.value");        
        action.setParams({
            "rectypeselection": recvalue
        });        
        action.setCallback(this, function(response){           
            component.set("v.recid", response.getReturnValue());
            var state = response.getState();
            if (state === "SUCCESS") {
                var createRecordEvent = $A.get("e.force:createRecord");
                var recidconsole = component.get("v.recid");
                createRecordEvent.setParams({
                    "entityApiName": "Account",
                    "recordTypeId" : recidconsole
                });            
                createRecordEvent.fire();
            }
            else if(state == "INCOMPLETE"){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Oops!",
                    "message": "No Internet Connection"
                });
                toastEvent.fire();
            } else if(state =="ERROR"){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Error!",
                    "message": "Please contact your administrator"
                });
                toastEvent.fire();
            }
        });        
        $A.enqueueAction(action);             
    },
    closeModal : function (component, event, helper) {
        component.set("v.isOpen", false);
    },
    openModal : function (component, event, helper) {
        component.set("v.isOpen", true);
    },
    listofrecordtypes : function (component, event, helper){
        var action = component.get("c.getRecordtypeinfo");
        action.setCallback(this, function(response){
            console.log(response.getReturnValue());
            component.set("v.rectypes", response.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})