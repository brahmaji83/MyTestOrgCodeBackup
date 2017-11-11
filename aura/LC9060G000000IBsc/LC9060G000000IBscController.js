({
    callme :function(component) {
        var name=component.find("name").get("v.value");
        component.find("Myname").set("v.value" , name);
            console.log(name);

        
    }
})