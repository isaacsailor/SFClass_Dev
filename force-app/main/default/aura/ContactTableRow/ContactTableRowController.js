({
    handleSelectionChange : function(cmp, event, helper) {
        var selectCont = event.getParam("arguments");
        var thisCont = cmp.get("v.contact");
        var theRow = cmp.find("contRow");
        
        if(thisCont.Id == selectCont.selectThisCont){
            cmp.set("v.selectedState", "true");
            $A.util.addClass(theRow, "row-selected");
        } else {
            cmp.set("v.selectedState", "false");
            $A.util.removeClass(theRow, "row-selected");
        }
    },
    contRowClick : function(cmp, event, helper){
        var theContact = cmp.get("v.contact");
        console.log('Contact Row Clicked');
        console.log(theContact);
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
            "url": '/contacts/'+theContact.Id,
            "isredirect" :false
        });
        urlEvent.fire();    }
})