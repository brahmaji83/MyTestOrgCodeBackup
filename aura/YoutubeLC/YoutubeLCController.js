({
	youtubesearch : function(component, event, helper) {
        var action = component.get("c.search");
        action.setParams({
            searchText: component.get("v.searchstring")
        });
        action.setCallback(this, function(response){
            console.log(response.getReturnValue());
            component.set("v.Items", response.getReturnValue());
        });
        $A.enqueueAction(action);		
	},
    
    openModal : function(component, event, helper) {
        //var evid = event.getSource().get("v.id");
        var evid = event.target.id;
        console.log(evid);
        component.set("v.youtubeid", "https://www.youtube.com/embed/"+evid+"?autoplay=1&showinfo=0");
        component.set("v.showmodal", true);
    },
    ClosetheModal : function(component, event, helper) {
        component.set("v.showmodal", false);
    }
})