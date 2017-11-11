public class Overcomerecursive {
    
    private static boolean check = true;
    private static integer i = 0;
    public Overcomerecursive(){
        system.debug('entered in constructor');
    }
    public static boolean runonce(){
        
        system.debug(i);
        i++;
        system.debug(i+'--->'+check);
        if(check){
            check = false;
            return true;
        }
        else{
            return check;
        }
    }

}