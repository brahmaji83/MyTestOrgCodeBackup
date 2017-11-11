({
    filesave : function(component, event) {        
        console.log('etered filesave');
        
        var spinner = component.find("mySpinner");
		$A.util.toggleClass(spinner, "slds-hide");
        
        console.log('file detected');
        var varfile = component.get("v.FileList");     
        console.log(varfile);
        var url = 'https://api.cloudinary.com/v1_1/brahmacloud/image/upload';
        var xhr = new XMLHttpRequest();
        var fd = new FormData();
        xhr.open('POST', url, true);
        xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
        var self = this;
        
        //Response
        xhr.onreadystatechange = function(e) {
            if (xhr.readyState == 4 && xhr.status == 200) {
                console.log(xhr.status);
                console.log('seems to be success');
                
                // File uploaded successfully
                var response = JSON.parse(xhr.responseText);                  
                var url = response.secure_url;
                console.log(url);  
                console.log(this);
                
                self.createPropertyImage(component, event, url);
                
                /*
                var action = component.get("c.createEntry");
                action.setParams({
                    parentId : component.get("v.ParentId"),
                    cloudURL : url,
                    primaryflag : component.find("Primary").get("v.checked")
                });
                action.setCallback(this, function(response){
                    console.log(response.getState());
                    console.log(response.getReturnValue());
                });
                $A.enqueueAction(action);
                console.log('after enqueue');
                */
            }
            else{
                if(xhr.status == 400){
                    var response = JSON.parse(xhr.responseText);
                    console.log(response);
                    
                }                
            }
        };
        fd.append('upload_preset', 'gko27xij');
        fd.append('tags', 'browser_upload'); // Optional - add tag for image admin in Cloudinary
        
        for(var i=0;i< varfile.length; i++){
            fd.append('file', varfile[i]);	
        }
        
        xhr.send(fd);
    },
    
    //Uncheck the other primary
    checkPrimary : function(component, event, firedComp) {
        var thiscompNumber = component.get("v.compNumber");
        if (firedComp != thiscompNumber ){                                    
            if(component.find("Primary").get("v.checked")){
                component.find("Primary").set("v.checked", false);                
            }            
        }        
    },
    
    createPropertyImage : function(component, event, cloudURL){
        console.log('call server ');
        var action = component.get("c.createEntry");
        action.setParams({
            parentId : component.get("v.ParentId"),
            cloudURL : cloudURL,
            primaryflag : component.find("Primary").get("v.checked")
        });
        action.setCallback(this, function(response){
            //To control spinner visibility
            //

            var childGlobalIds = event.getParam('childGlobalIds');
            if($A.util.isEmpty(childGlobalIds)) {
                childGlobalIds = [component.getGlobalId()];
            } else {
                childGlobalIds.push(component.getGlobalId());
            }
            var appEvent = $A.get("e.c:ImageUploadSuccess");            
            appEvent.fire();
                                               
            console.log(response.getState());
            console.log(response.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    
    
})