public class TestChildLC {

    @AuraEnabled
    public static void callServerMethod(){
        System.debug('called');
    }
}