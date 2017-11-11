({
	callApex : function(component, event, helper) {
        console.log(component.get("v.recordId"));
		var action = component.get("c.cloneaRecord");
        action.setParams({
            "modelId" : component.get("v.recordId")
        })
        action.setCallback(this, function(response){
            console.log(response.getReturnValue());
            component.set("v.accRec", response.getReturnValue());
            console.log(component.get("v.accRec.Name"));
            
            var rec = component.get("v.accRec");
            /*
            console.log(rec);
            console.log('rec output'+rec);
            delete rec.Id;                        
            console.log('rec output after'+rec);
            console.log(rec);
            */
            if(!$A.util.isEmpty(response.getReturnValue())){
                var createRecordEvent = $A.get("e.force:createRecord");
                var sapiobject = {
                    "entityApiName" : "Account",
                    "defaultFieldValues": rec
                };
                createRecordEvent.setParams(sapiobject);
                createRecordEvent.fire();
            }
            
            console.log('after createrecord');
        });
        $A.enqueueAction(action);
	}
})