({
    doInit : function(cmp, event, helper) {
        var leadId = cmp.get("v.leadId");
        //alert('test ' + leadId);
        var recordId = cmp.get("v.recordId");
        //alert('recordId ' + recordId);
        if( leadId.indexOf('[') != -1 ){
            leadId = leadId.substring(1, leadId.length-1)
            //alert('test ' + leadId);
            var newleadId = leadId.split(', ');
            //alert('test ' + newleadId);
            cmp.set("v.leadId", newleadId );
        }
        if( leadId === 'NotDefined' ){
            leadId = [recordId];
            cmp.set("v.leadId", leadId );
        };
        var leadId = cmp.get("v.leadId");
        cmp.set("v.disabled",false);
        //alert('newLeadId ' +leadId);
        
        var action = cmp.get("c.fetchExternalsystemNames");
        
        var inputSelectionCountry = cmp.find("ExternalSystemSelector");
        var optsCountry = [];
        action.setCallback(this, function(a) {
            for (var i = 0; i < a.getReturnValue().length; i++) {
                optsCountry.push({
                    "class": "optionClass",
                    "label": a.getReturnValue()[i],
                    "value": a.getReturnValue()[i]
                });
            }
            console.log("jscontroller picklist" + a.getReturnValue());
            
            inputSelectionCountry.set("v.options", optsCountry);
        });
        $A.enqueueAction(action);
        
    },
    sendToExternalSystem : function(component, event, helper) {        
        var leadIds = component.get("v.leadId");       
        console.log(leadIds);
        var theExternalSystemName = component.get("v.selectedText");
        var theExtUserEmail = component.get("v.myText");       
        if(theExternalSystemName == "External User"){
            var validationResult = 'OK'; // helper.validateEmail( theExtUserEmail );
            if( validationResult != 'OK'){
                component.set("v.messageVisible", "true");
                component.set("v.messageText", validationResult);
                return;
            } else {
                component.set("v.messageVisible", "false");
                component.set("v.messageText", "");
            }
        }       
        var leadIds = component.get("v.leadId");        
        var theExternalSystemName = component.get("v.selectedText");
        var theExtUserEmail = component.get("v.myText");
        var checkConfirm=false;
        if(theExternalSystemName != "External User"){
            checkConfirm=true;
        }
        if(theExternalSystemName == "External User"){
            var inputEmail = component.find("ExternalUserEmailId");
            var theExtUserEmail1 = inputEmail.get("v.value");
            var lastSixChar = theExtUserEmail1.substr(theExtUserEmail1.length - 7);//This should return abb.com
            checkConfirm =false;
            if(lastSixChar.endsWith("abb.com") && theExternalSystemName == "External User"){
                checkConfirm =true;
                // alert(checkConfirm);
            }else {
                //var staticLabel = $A.get("$Label.ErrorMessage");
                //var ErrorMessageinAlert = staticLabel + theExtUserEmail;
                // checkConfirm= confirm(ErrorMessageinAlert);
                checkConfirm= confirm('If you want to process the External Email :' + theExtUserEmail);
                // alert('Check Info :: ' + checkConfirm);
                
            }
        }
        var btn = event.getSource();
        //component.set("v.disabled",true); 
        if(checkConfirm==true ){    
            component.set("v.disableEmail",true);
            btn.set("v.disabled",true);//Disable the button	
            var action = component.get("c.sendLeadToExternalSystem");
            //var action = component.get("c.sendLeadToTechnicalContacts")
            action.setParams({ externalSystem : theExternalSystemName, leadIds : leadIds, extUserEmailId : theExtUserEmail});   
            action.setCallback(this, function(response) {        	
                
                
            });
            $A.enqueueAction(action);  
        }else{
            //alert('False');
            component.set("v.myText","");
            btn.set("v.disabled",false);//Enable the button
            
        }
        
        var cmpTarget = component.find('ExternalSystemSelector');
        $A.util.addClass(cmpTarget, 'picklistcss');
        
        //$A.enqueueAction(action);               
    },
    handleError: function(component, event){
        /* do any custom error handling
         * logic desired here */
        // get v.errors, which is an Object[]
        var errorsArr  = event.getParam("errors");
        for (var i = 0; i < errorsArr.length; i++) {
            console.log("error " + i + ": " + JSON.stringify(errorsArr[i]));
        }
    },
    
    handleClearError: function(component, event) {
        
        
    }
    
})