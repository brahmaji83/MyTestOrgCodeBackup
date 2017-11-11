public class RecursiveCheck {
    private static boolean duplicate=true;
    public static boolean dupcheck(){
        if(duplicate){
            duplicate = false;
            return true;
        }
        else{
            return duplicate;
        }
            
        
    }

}