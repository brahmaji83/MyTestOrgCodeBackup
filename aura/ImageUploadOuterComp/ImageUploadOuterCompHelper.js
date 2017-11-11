({
    addMoreFile : function(component, propId, cmpNumber) 
    {
        console.log('rec id of obj '+component.get("v.recordId"));
        $A.createComponent(
            "c:ImageUploadComp",
            {
                "ParentId" : component.get("v.recordId"),
                "compNumber" : cmpNumber,
                "disableCheckbox" : component.get("v.primaryExist")
            },
            //inner function!!
            function(newElement, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    //create an empty body place holder
                    var body = component.get("v.body");
                    // replace empty with component created above
                    body.push(newElement);
                    component.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                    else if (status === "ERROR") {
                        console.log("Error: " + errorMessage);
                        // Show error message
                    }
            }
        );       
    },
    
    uploadImages : function(component, event){
        var appEvent = $A.get("e.c:ImageUploadEvent");    	
		appEvent.fire();  
    },
})