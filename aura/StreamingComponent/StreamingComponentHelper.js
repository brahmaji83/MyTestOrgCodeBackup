({
    startListening: function (component, event, helper) {
        //Get a valid Session Id
        var sessionAction = component.get("c.getUserSession");
        
        sessionAction.setCallback(this, function (a) {
            var sid = a.getReturnValue();
            //    alert('sid'+sid);
            console.log(sid);
            
            $.cometd.init({
                url: '/cometd/39.0',
                requestHeaders: {Authorization: 'OAuth ' + sid},
                appendMessageTypeToURL: false,
                logLevel: [ "warn" | "info" | "debug"]
            });
            
            //subscribe
            $.cometd.subscribe('/topic/BookCreation', $A.getCallback(function (message) {
                console.log('in subscribe');
                var sEvent = $A.get("e.c:StreamingAPIEvent");
                console.log(message);
                console.log(component.get("v.recordId"));
                var recId = component.get("v.recordId");
                
                if(recId === message.data.sobject.Opportunity__c){
                    
                    sEvent.setParams({
                        topic: 'The Topic',
                        data: message.data.sobject,
                        event: message.data.event
                    }).fire();
                    
                }
                
                
            }));
            
            //closes connection of window close
            window.onbeforeunload = function () {
                $.cometd.disconnect();
            };
        });
        
        $A.enqueueAction(sessionAction);
        
    },
    handleShowNotificationEvent: function (component, event, helper) {
        console.log('event');
        console.log(event);
        var data = event.getParam('data') || '';
        
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": data.Id,
            "slideDevName": "related"
        });
        navEvt.fire();
    }
})