//Isaac Seemann
//3-24-2020
//
//Class of static query functions leveraging SOQL and SOSL
public class QueryAssignment {
    
    //Call function with account ID paramater and recieve a list of all contacts related to account
    public static List<Contact> contactsRelatedToAcct(ID acctId){
        //Access contact Lookup field defining relationship between Contact and an Account
        List<Contact> relatedCont = [SELECT Name FROM Contact WHERE AccountId= :acctId];
        
        return relatedCont;
    }
    
    //Search accross Accounts, Contacts, Opportunities and Leads for any occurance of parameter sting.
    //Returned Map contains Object type 'key' and aggrigated parameter string occurances 'values'
    public static Map<String,Integer> countSearchObjects(String searchString){
        
        Map<String,Integer> searchTypeAggregate = new Map<String,Integer>();
        //Dynamic SOSL query. Can't dynamicly search all Objects because Apex SOSL requires explicit return statement.
        String queryString = 'FIND {'+searchString+'} IN ALL FIELDS RETURNING Account, Contact, Opportunity, Lead';
        List<List<sObject>> searchResults = search.query(queryString);
        
        //Build return Map based on SOSL results
        for(List<sObject> listOfOneType : searchResults){
            searchTypeAggregate.put(listOfOneType[0].getSObjectType().getDescribe().getName(), listOfOneType.size());
            
        }   
        return searchTypeAggregate;
    }
    
    //Return 100 most recently created Objects of given type. 
    public static List<sObject> mostRecentObjects(String objType){
        //Dynamic SOQL query leveraging standard creation date values.
        String soqlQuery = 'SELECT Id,createdDate FROM '+objType+' ORDER BY createdDate DESC LIMIT 100';
        List<sObject> mostRecentList = Database.query(soqlQuery);
        
        return mostRecentList;
    }
}