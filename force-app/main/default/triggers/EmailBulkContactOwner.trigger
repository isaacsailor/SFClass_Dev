trigger EmailBulkContactOwner on Contact (after update) {
    Map<Id,List<String>> emailOwners = new Map<Id,List<String>>();
    
    for(Contact updatedContact : Trigger.new){
        if(updatedContact.lastModifiedById != updatedContact.OwnerId){
            String emailEntry = updatedContact.lastModifiedById+' updated contact '+updatedContact.Name;
            if(emailOwners.containsKey(updatedContact.OwnerId)){
                emailOwners.get(updatedContact.OwnerId).add(emailEntry);
            }else{
                List<String> emailRecipient = new List<String>();
                emailRecipient.add(emailEntry);
                emailOwners.put(updatedContact.OwnerId,emailRecipient);
                
            }
        }
    }
    Set<Id> recipientIds = emailOwners.keySet();
    for(Id newEmail : recipientIds){
        //Incomplete
    }
}