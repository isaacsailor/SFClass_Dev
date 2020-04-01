trigger CountTasks on Task (after insert, after delete, after undelete) {
    //increment/set task counter when new task is created or undeleted
    if(Trigger.isInsert || Trigger.IsUndelete){
        Task newTask = Trigger.new[0];
        Account relatedAcct = [SELECT Task_Count__c FROM Account WHERE Id = :newTask.WhatId];
        //Set task counter to total related tasks after insertion or restoration
        List<Task> existingTasks = [SELECT Id FROM Task WHERE WhatId = :relatedAcct.Id];
        relatedAcct.Task_Count__c = existingTasks.size();
        
        update relatedAcct;
    } else {//decrement task counter when task is deleted
        Task removedTask = Trigger.old[0];
        Account relatedAcct = [SELECT Task_Count__c FROM Account WHERE Id = :removedTask.WhatId];
        //initialize counter value based on related tasks before deletion occured
        if(relatedAcct.Task_Count__c == null){
            List<Task> existingTasks = [SELECT Id FROM Task WHERE WhatId = :relatedAcct.Id];
            relatedAcct.Task_Count__c = existingTasks.size();
        }
        relatedAcct.Task_Count__c -= 1;
        
        update relatedAcct;
    }
}