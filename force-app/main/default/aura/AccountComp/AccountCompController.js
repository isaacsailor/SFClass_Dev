({
    doInIt : function(cmp, event, helper) {//Initalize acount table data
        var queryForAccounts = cmp.get("c.getAccounts");
        
        queryForAccounts.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.accountList", response.getReturnValue());
            }
            else {
                //cmp.set("v.errors", "Accounts failed to load! State: " + state);
                console.log("Failed with state: " + state);
            }
        });
        // Send query to Apex controller for execution
        $A.enqueueAction(queryForAccounts);
    },
    handleSelectionChange : function(component, event, helper) {
        var relatedAcct = event.getParam('arguments');
        var acctRows = component.find('acctRow');
        console.log("Account in Comp: "+relatedAcct.selectThisAcct);
        acctRows.forEach((item) => {
            item.eventCatcher(relatedAcct.selectThisAcct);
        });
    }
})