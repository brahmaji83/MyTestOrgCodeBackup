public class getTestContactRev {
	
    @AuraEnabled
    public static List<TestContactRev__c> getRevRecords(Id recId){
        return [select id, Name, Amount__c, Contact__c from TestContactRev__c where TestContact__c=: recId];
    }
}