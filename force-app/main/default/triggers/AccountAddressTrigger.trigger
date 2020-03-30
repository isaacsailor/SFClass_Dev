trigger AccountAddressTrigger on Account (before insert, before update) {

    for(Account verifyAccount : Trigger.New){
        if(verifyAccount.Match_Billing_Address__c && 
           (verifyAccount.ShippingPostalCode != verifyAccount.BillingPostalCode)){
               verifyAccount.ShippingPostalCode = verifyAccount.BillingPostalCode;
           }
    }
}