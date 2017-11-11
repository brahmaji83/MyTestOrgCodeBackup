public class GetSessionId {
    @AuraEnabled
    public static String getUserSession() {
        return UserInfo.getSessionId();
    }
}