({
    handleEvent : function(component, event, helper) {
        var searchValue = event.getParam("SearchString");
        component.set("v.searchinput", searchValue);
        console.log(searchValue);
        
        var action = component.get("c.getRecords");
        action.setParams({
            ObjectName : component.get("v.object"),
            //       limits : component.get("v.limit"),            
            //       pageNumber : component.get("v.page"),
            //      pageSize : component.get("v.pageSize"),
            searchStr : component.get("v.searchinput"),
            //        fieldSetName : component.get("v.fieldSetNameLC"),
            //       fiednameServer : component.get("v.fieldnameToSearch")
            recId : component.get("v.recordId")
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                component.set("v.countOfRecords", response.getReturnValue().length);
                component.set("v.accRecords", response.getReturnValue());
            }
        });
        
        $A.enqueueAction(action);
        
    },
    
    getFieldsFromFS : function(component, event, helper) {
        console.log('entered getfieldsfromfs');
        var action = component.get("c.getFieldsFromFSApex");
        action.setParams({
            strFieldSetName : component.get("v.FieldsToDisplay"),
            strObjectName : component.get("v.FieldSetObject")
        });
        action.setCallback(this,function(response){
  			component.set("v.fields", response.getReturnValue());          
        });
        $A.enqueueAction(action);
                           
    }
})