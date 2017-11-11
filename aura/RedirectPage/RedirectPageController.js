({
    createRecord : function (component, event, helper) {
    var createRecordEvent = $A.get("e.force:createRecord");
    console.log('c1');
    createRecordEvent.setParams({
        "entityApiName": "Account",
        "recordTypeId":"01228000000T3HdAAK"     
    });
    console.log('c2');
    createRecordEvent.fire();

},
    handlecreateEvent : function(component, event) {
    	console.log('c3');
   /*     var evt = $A.get("e.force:navigateToURL");
        console.log('c4');
        console.log(evt);
      /*  evt.setParams({
            componentDef : "c:RedirectPage"
        });
        */
  /*      evt.setParams({
        	"url": "/c/RedirectPageLA.app"
        });
        console.log('c5');  */

//       evt.fire();
    }
})