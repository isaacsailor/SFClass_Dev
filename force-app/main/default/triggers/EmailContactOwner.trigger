trigger EmailContactOwner on Contact (after update) {
    
    Contact updatedContact = Trigger.new[0];
    //Email owner of contact if contact was modified by someone else.
    if(updatedContact.lastModifiedById != updatedContact.OwnerId){
        Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
        
        User notContactOwner = [SELECT Id, Name, Email FROM User WHERE Id = :updatedContact.lastModifiedById];
        User contactOwner = [SELECT Id, Email FROM User WHERE Id = :updatedContact.OwnerId];
        //Build email object
        mail.setToAddresses(new String[] {contactOwner.Email});
        String emailBody = notContactOwner.Name+'('+notContactOwner.Email+') updated contact:'+
            updatedContact.FirstName+' '+updatedContact.LastName+'(ID:'+updatedContact.Id+')';
        mail.setSubject('Contact you own was modified by someone');
        mail.setHtmlBody(emailBody);
        Messaging.SingleEmailMessage[] mailList = new List<Messaging.SingleEmailMessage>{mail};
            
            Messaging.SendEmailResult[] results = Messaging.sendEmail(mailList);
        
        if (results[0].success) {  
            System.debug('The email was sent successfully.');        
        } else {  
            System.debug('The email failed to send: ' + results[0].errors[0].message);    
        }
    }
}