({ handleClick: function(component, event, helper) {
    var newMessage = event.getSource().get("v.label");
    console.log("handleClick2: Message: " + newMessage);
    component.set("v.message", newMessage);
}})