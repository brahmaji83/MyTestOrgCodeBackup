({  
    handleInit : function(component, event, helper){
        console.log('component id'+component.getGlobalId());
        console.log('Component number'+component.get("v.compNumber"));
    },
    
    handlerUploadEvent : function(component, event, helper) {      
        console.log('entered controller');
        helper.filesave(component, event);
    },
    
    //To check primary
    checkAllComponents : function(component, event, helper){
        if(component.find("Primary").get("v.checked")){
            console.log(' check all comp fired from '+component.get("v.compNumber") );
            //Application Event
            var appEvent = $A.get("e.c:ImagePrimaryCheckEvent");  
            appEvent.setParams({ 
                "componentNumber" : component.get("v.compNumber") 
            });
            appEvent.fire(); 
        }        
    },
    //Handler primary event
    handlerPrimaryCheckEvent : function(component, event, helper){        
        console.log(event.getParam("componentNumber"));
        console.log('Component number'+component.get("v.compNumber"));
        var firedComp = event.getParam("componentNumber");
        helper.checkPrimary(component, event, firedComp);
    },
    
})