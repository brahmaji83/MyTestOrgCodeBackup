({
	searchit : function(component, event, helper) {
        // var action = component.get("c.searchitcntrlr");
        var accname = component.find("searchid");
        var srcvalue = accname.get("v.value");
        if(srcvalue == null || srcvalue ==''){
            accname.set("v.errors", [{
                message : "Enter something"
            }]);
        }
        else{
            accname.set("v.errors", null);
            helper.searchhelper(component, event);
        }
		
	}
})