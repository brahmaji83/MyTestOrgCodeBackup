({
	createItem : function(component, campitemLC) {
        var action = component.get("c.saveItem");
        var campitemhelper = component.get("v.newItem");
        console.log(campitemhelper);
        action.setParams({"campitem" : campitemhelper});
  /*      action.setCallback(this, function(response){
            var campItems = component.get("v.items");
            campItems.push(response.getReturnValue());
            component.set("v.items", campItems);
        });
	*/
    $A.enqueueAction(action);
	}
})