public class StringArrayTest {
    public static List <String> generateStringArray(Integer n){
        List<String> listOfTestElements = new List<String>();
        
        for(Integer i = 0; i < n; i++){
            listOfTestElements.add('Test ' + i);
        }
        
        return listOfTestElements;
    }
}