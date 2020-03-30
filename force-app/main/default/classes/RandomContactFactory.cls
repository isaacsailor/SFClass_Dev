public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numOfContacts, String lastNameParam){
        List<Contact> generatedContacts = new List<Contact>();
        
        for(Integer i = 0; i < numOfContacts; i++){
            Contact c = new Contact(FirstName='Test ' + i, LastName=lastNameParam);
            generatedContacts.add(c);
        }
            
        
        return generatedContacts;
    }
}
//The 'generateRandomContacts' method must accept an integer as the first parameter,
// and a string as the second. The first parameter controls the number of contacts 
// being generated, the second is the last name of the contacts generated.
//The 'generateRandomContacts' method should have a return type of List<Contact>.
//The 'generateRandomContacts' method must be capable of consistently generating 
//contacts with unique first names.
//For example, the 'generateRandomContacts' might return first names based on 
//iterated number (i.e. 'Test 1','Test 2').
//The 'generateRandomContacts' method should not insert the contact records into the 
//database.