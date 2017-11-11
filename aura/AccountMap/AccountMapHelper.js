({
    navigateToDetailsView : function(component, accountId) {
        console.log(accountId);
       
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
            "recordId": accountId
        });
        navEvt.fire();
    }
})