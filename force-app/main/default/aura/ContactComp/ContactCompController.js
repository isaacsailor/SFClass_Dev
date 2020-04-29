({
    doInIt : function(cmp, event, helper) {//Initalize acount table data
        var queryForContacts = cmp.get("c.getContacts");
        
        queryForContacts.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.contactList", response.getReturnValue());
            }
            else {
                //cmp.set("v.errors", "Contacts failed to load! State: " + state);
                console.log("Failed with state: " + state);
            }
        });
        // Send query to Apex controller for execution
        $A.enqueueAction(queryForContacts);
    },
    handleSelectionChange : function(component, event, helper) {
        var relatedCont = event.getParam('arguments');
        var contRows = component.find('contRow');
        
        contRows.forEach((item) => {
            item.eventCatcher(relatedCont.selectThisCont);
        });
                                 
    }
})