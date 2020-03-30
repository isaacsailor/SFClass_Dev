public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String searchParam){
        List<List<sObject>> results = [FIND :searchParam IN NAME FIELDS RETURNING Contact, Lead];
        
        return results;
    }
}