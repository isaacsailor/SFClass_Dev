({
    handleSelectionChange : function(cmp, event, helper) {
        var selectAcct = event.getParam('arguments');
        var thisAcct = cmp.get("v.account");
        var theRow = cmp.find("acctRow");
        //console.log("Account in Row: "+selectAcct.selectThisAcct);
        if(thisAcct.Id === selectAcct.selectThisAcct){
            cmp.set("v.selectedState", "true");
            $A.util.addClass(theRow, "row-selected");
            console.log(thisAcct.Name + " selected");
        } else {
            cmp.set("v.selectedState", "false");
            $A.util.removeClass(theRow, "row-selected");
            console.log(thisAcct.Name + " unselected");
        }
    }
})