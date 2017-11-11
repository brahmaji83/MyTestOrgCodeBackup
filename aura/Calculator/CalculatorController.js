({
	addit : function(component, event, helper) {
        var buttonlabel = event.getSource().getLocalId();
        var label = component.find(buttonlabel).get("v.label");
        var attr = component.get("v.inputattr");
        attr += buttonlabel;
        component.set("v.inputattr", attr);
	},
    
    clearit : function(component, event, helper){
        component.set("v.inputattr", "");
    },
    
    calculate : function(component, event, helper){
        try{
            var sgetattr = component.get("v.inputattr"); 
//            var sw = new SecureWindow();
            var output = eval(sgetattr);
            console.log(output);
            component.set("v.inputattr", output);            
        }
        catch(err){
            console.log(err);
            component.set("v.inputattr", "Something wrong with your input");            
        }
	}
    
    
})