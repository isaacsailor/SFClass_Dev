trigger ContactPhoneEmailMatchAccount on Contact (before insert, before update) {

    Contact newContact = Trigger.new[0];
    
    if(newContact.Email_Match_Account__c || newContact.Phone_Match_Account__c){
        Account relatedAcct = [SELECT Email__c,Phone FROM Account WHERE Id = :newContact.AccountId];
        //Copy Account email to contact
        if(newContact.Email_Match_Account__c && (relatedAcct.Email__c != null)){
            newContact.Email = relatedAcct.Email__c;
        }
        //Copy Account phone to contact
        if(newContact.Phone_Match_Account__c && (relatedAcct.Phone != null)){
            newContact.Phone = relatedAcct.Phone;
        }
    }
}