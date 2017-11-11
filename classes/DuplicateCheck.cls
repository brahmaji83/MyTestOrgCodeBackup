public class DuplicateCheck {
    
    private static boolean run = true;
    private static integer count = 1;
    public static boolean runonce(){
        if(run){
            run = false;
            return true;
        }
        else{
            return run;
        }
    }

}