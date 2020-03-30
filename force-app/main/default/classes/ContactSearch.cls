public class ContactSearch {
    public static List<Contact> searchForContacts(String myLastName, String myPostalCode){
        
        List<Contact> contactResult = [SELECT Name FROM Contact WHERE LastName=:myLastName AND
                                  MailingPostalCode=:myPostalCode];
        
    	return contactResult;
    }
}