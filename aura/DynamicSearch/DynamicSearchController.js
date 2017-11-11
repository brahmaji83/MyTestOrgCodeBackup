({
    handleSearch : function(component, event, helper) {
        var cmpEvent = component.getEvent("DynamicSearchEvent");
        var val = component.find("inpId").get("v.value");
        var attrVal = component.get("v.searchStr");
        cmpEvent.setParams({
            "SearchString" : attrVal
        });
        cmpEvent.fire();       
    },
    getValues : function(component, event, helper){
        console.log('entered get Values');
        var action = component.get("c.getPicklistValues");
        action.setParams({
            strFieldName : component.get("v.attrFieldName"),
            strObjectName : component.get("v.sObjectName")
        });
        console.log('entered get Values');
        action.setCallback(this, function(response){
            console.log('entered get Values');
            component.set("v.lstValues", response.getReturnValue());
            console.log(component.get("v.lstValues"));
        });
        $A.enqueueAction(action);
    }
})