public with sharing class getAllTasksOppty {
	
    @AuraEnabled
    public static List<TasK> getAllTasks(Id OpptyId){
        return [select Id, Subject from Task where id=:OpptyId];
    }
}