@isTest
public class TestRestrictContactByName {
    @isTest static void TestInsertInvalidLastName(){
        Contact testCont = new Contact(LastName='INVALIDNAME');
        // Perform test
        Test.startTest();
        Database.SaveResult result = Database.insert(testCont, false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+testCont.LastName+'" is not allowed for DML',
                            result.getErrors()[0].getMessage());
    }
}