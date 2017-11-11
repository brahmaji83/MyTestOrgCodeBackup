({
	accountlist : function(component, event, helper) {        
        var accId = component.find("inp1");
        var accname = accId.get("v.value");      
        if(accname == null || accname == ''){
            accId.set("v.errors", [{
                message:"Enter something to search" 
            }]);          
        }
        else{
            accId.set("v.errors", null);         
            helper.searchaccounts(component, event);            
        }        
    },
    
    openPopUp : function(component, event, helper){
        var funds = component.get("v.AccountList");        
        console.log(event.target.parentElement.dataset.id);
        component.find("popup").showPopup(funds[event.target.parentElement.dataset.id], event.clientX + 20, event.target.offsetTop );

    },
    hidePopup : function(component, event, helper){
        var popup = component.find('popup').getElement();
        $A.util.addClass(popup, 'slds-hidden');
    }
})