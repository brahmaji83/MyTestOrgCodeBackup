public class AutoOppRecursiveCheck {
    private static boolean checkit = true;
    public static boolean checkonce(){
        if(checkit){
            checkit = false;
            return true;
        }else{
            return checkit;
        }
    }

}