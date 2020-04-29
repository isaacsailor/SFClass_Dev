({
    init: function(cmp, event, helper) {//Initalize table columns
        cmp.set('v.caseCol', [{ label: 'Case Number', fieldName: 'CaseNumber', type: 'text'},
                              { label: 'Subject', fieldName: 'Subject', type: 'text'},
                              { label: 'Status', fieldName: 'Status', type: 'text'},
                              {type: "button", typeAttributes: {
                                  label: 'Edit',
                                  name: 'Edit',
                                  title: 'Edit',
                                  disabled: false,
                                  value: 'edit',
                                  iconPosition: 'left'
                              }}]);
        
        var queryForCases = cmp.get("c.getCases");
        
        queryForCases.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.caseList", response.getReturnValue());
            }
            else {
                cmp.set("v.errors", "Cases failed to load! State: " + state);
                console.log("Failed with state: " + state);
            }
        });
        // Send query to Apex controller for execution
        $A.enqueueAction(queryForCases);
    },
    
    handleRowAction : function(component, event, helper) {
        var rec = event.getParam('row');       
        
        //alert('Edit');
        var editRecordEvent = $A.get("e.force:editRecord");
        console.log(rec.Id);
        editRecordEvent.setParams({"recordId": rec.Id});
        editRecordEvent.fire();
        
        
    },
    handleRowSelection : function(component, event, helper) {
        var relatedAcctId = event.getParam('selectedRows')[0].AccountId;
        var relatedContId = event.getParam('selectedRows')[0].ContactId;
       
        
        var selectRelatedRecords = component.getEvent("caseSelectionChange");
        selectRelatedRecords.setParams({ "acctId": relatedAcctId,"contId": relatedContId });
        selectRelatedRecords.fire();
        
    }
})