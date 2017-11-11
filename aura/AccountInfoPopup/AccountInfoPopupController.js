({
	showPopup : function(component, event, helper) {
        console.log('showpoupcalled');
        var args = event.getParam('arguments');
        component.set("v.acc", args.acc);
		var popup = component.find('popup').getElement();        
        if (popup && popup.setAttribute) {                     
            popup.setAttribute("style", "left:" + args.x + "px;top:" + args.y + "px");
        }
        $A.util.removeClass(popup, 'slds-hidden');
	},
    
    hidePopup: function(component) {
        var popup = component.find('popup').getElement();
        $A.util.addClass(popup, 'slds-hidden');
    }
})