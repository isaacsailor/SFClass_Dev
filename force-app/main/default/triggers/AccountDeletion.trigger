trigger AccountDeletion on Account (before delete) {
    
	// Prevent the deletion of accounts if they have related opportunities.
    for (Account a : [SELECT Id, Name FROM Account
                     WHERE Id IN (SELECT AccountId FROM Opportunity WHERE (NOT StageName LIKE 'Closed%')) AND
                     Id IN :Trigger.old]) {
        Trigger.oldMap.get(a.Id).addError(
            'Cannot delete Account:'+a.Name+' because it contains open related opportunities.');
    }
}