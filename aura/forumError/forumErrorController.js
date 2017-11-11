({
    stopPasteEvent : function(component, event, helper) {
		console.log('test');
        console.log(event);
        alert('** fired paste event ');
        event.preventDefault();
        var selectedFieldName =event.getSource().get("v.label");
        var selectedFieldValue = component.find(selectedFieldName).get("v.value");
        component.find(selectedFieldName).set('v.value', "");
        var appEvent = $A.get("e.c:appEvent");
        appEvent.fire();
     //   alert('** fired paste event ');

    },
    handleApplicationEvent : function(component, event, helper) {
        console.log('entered fire');
        component.set("v.confirmEmail", '');
    }
})