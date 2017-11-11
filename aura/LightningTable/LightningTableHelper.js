({
    getsObjectRecords : function(component,page) {
        var page = page || 1;
        var action = component.get("c.getRecords");
        
        console.log(component.get("v.fields"));
        var fields = component.get("v.fields");
        console.log(component.get("v.fields"));
        action.setParams({
            ObjectName : component.get("v.object"),
            limits : component.get("v.limit"),
            fieldstoget : fields.join(),
            pageNumber : page,
            pageSize : component.get("v.pageSize"),
            searchStr : component.get("v.searchString"),
            fieldSetName : component.get("v.fieldSetNameLC"),
            fiednameServer : component.get("v.fieldnameToSearch")
        });
        
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                document.getElementById("data").innerHTML ='';
                component.set("v.latestRecords",response.getReturnValue());
                console.log(component.get("v.latestRecords"));
                component.set("v.page",page);
                var retResponse = response.getReturnValue();
                component.set("v.total",retResponse.total);
                
                console.log(component.get("v.fields"));
                console.log(retResponse.fieldsToDisplay);
                component.set("v.fields", retResponse.fieldsToDisplay);
                console.log(component.get("v.fields"));
                var fields = component.get("v.fields");
                component.set("v.pages",Math.ceil(retResponse.total/component.get("v.pageSize")));
                var retRecords = retResponse.sObjectrecords;
                console.log(retRecords);
                component.set("v.latestRecords",retResponse.sObjectrecords);
                console.log('entered');
                retRecords.forEach(function(s) {
                    var tableRow = document.createElement('tr');
                    fields.forEach(function(field){ 
                        var tableData = document.createElement('td');
                        var tableDataNode = document.createTextNode(s[field]);
                        tableData.appendChild(tableDataNode);
                        tableRow.appendChild(tableData);
                    });
                    document.getElementById("data").appendChild(tableRow);
                }); 
            }else if (state === "ERROR") {
                console.log('Error');
            }
        });
        $A.enqueueAction(action);
    }
}
 })