trigger UpdateBlankRelatedContact on Account (after update) {
    
    
    Account oldAcct = Trigger.old[0];
    Account updatedAcct = Trigger.new[0];
    if((oldAcct.Phone != updatedAcct.Phone)||(oldAcct.Email__c != updatedAcct.Email__c) ){
        //Retrieve all contacts related to the account that was updated
        List<Contact> relatedContacts = [SELECT Email,Phone FROM Contact WHERE AccountId = :updatedAcct.Id];
        List<Contact> updatedContacts = new List<Contact>();
        
        for(Contact cont : relatedContacts){
            Boolean contWasUpdated = false;
            //related contact's email will be updated with account's
            if((cont.Email == null) && (updatedAcct.Email__c != null)){
                cont.Email = updatedAcct.Email__c;
                contWasUpdated = true;
            }
            //related contact's phone is blank and will be updated with account's
            if((cont.Phone == null) && (updatedAcct.Phone != null)){
                cont.Phone = updatedAcct.Phone;
                contWasUpdated = true;
            }
            if(contWasUpdated){
                updatedContacts.add(cont);
            }
        }
        update updatedContacts;
    }
    
    
}