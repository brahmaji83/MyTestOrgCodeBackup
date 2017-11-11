public class StringArrayTest {
    public static List<String> generateStringArray(integer n){
        List<String> moreColors = new List<String>();
        for(Integer i=0;i<n;i++) {    
            moreColors.add('Test '+i);
            system.debug(moreColors[i]);
        }
        return moreColors;
    }
}