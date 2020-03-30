public class AccountHandler {
    public static Account insertNewAccount(String accountName){
        Account newAccount = new Account(Name=accountName);
        
        try{
            insert newAccount;
        } catch (DmlException e){
            newAccount = null;
            System.debug('A DML exception has occurred: ' +
                e.getMessage());
        }
        
        return newAccount;
    }
}