public class ListExample2 {
    public String wish {get;set;}
    @AuraEnabled
    public static List<Account> accountrecords(){
        return [select Id, Name from Account];
    }
    
    @AuraEnabled
    public static String fetchWishes(String greeting){
        system.debug('greeting   '+greeting);
        return 'This message from Controller'+greeting;
    }

}