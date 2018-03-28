public class StringArrayTest {
    
    public static List<string> generateStringArray(integer els) {
        
        List<String> testNames = new List<String>();
        for (integer i=0;i<els;i++){
            testNames.add('Test ' + String.valueOf(i));
        }
        return testNames;
    }
	
}