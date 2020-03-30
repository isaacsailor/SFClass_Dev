trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Opportunity> closeWonOpps = [SELECT Id FROM Opportunity WHERE Id IN :Trigger.New AND
                                     StageName='Closed Won'];
    List<Task> oppTasks = new List<Task>();
    for(Opportunity oppNeedsTask : closeWonOpps){
        oppTasks.add(new Task(Subject='Follow Up Test Task', WhatId=oppNeedsTask.Id));
    }
    
    insert oppTasks;
}