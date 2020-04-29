({
	handleSelectedState : function(cmp, event, helper) {
        var selectAcct = event.getParam("acctId");
        var selectCont = event.getParam("contId");
        var acctComp = cmp.find('acctTable');
        var contComp = cmp.find('contTable');
        
         //console.log("Account in Harness: "+selectAcct);
        
        acctComp.acctEventCatcher(selectAcct);
        contComp.contEventCatcher(selectCont);
	}
    
})