({
	Changegreeting : function(component, event, helper) {
        var swish = component.get("v.Greeting");
        var sGreeting = component.get("c.fetchWishes"); 
        console.log(swish);
        sGreeting.setParams({
            "greeting" : swish
        });
        
        sGreeting.setCallback(this, function(response){
            console.log(response.getState());
            component.set("v.Greeting", response.getReturnValue());
        });
        
        $A.enqueueAction(sGreeting);		
	},
    
    SearchAcc : function(cmp){
        var getaccs = cmp.get("c.accountrecords");
        getaccs.setCallback(this, function(response){
           cmp.set("v.accounts", response.getReturnValue()) ;
        });
        $A.enqueueAction(getaccs);
    }
})