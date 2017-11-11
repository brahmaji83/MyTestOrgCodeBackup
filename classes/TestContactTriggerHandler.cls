public class TestContactTriggerHandler 
{
    public static void createchildrecord(List<TestContact__c> trigid){
        Set<id> tcid = new Set<Id>();
        for(TestContact__c tc : trigid){
            if(tc.Expiration_Date__c != null){
                tcid.add(tc.Id);
            }
        }

        List<TestContactRev__c> tcrlist = new List<TestContactRev__c>();

        List<TestContactRev__c> tcrlistexisting = [select id, name from TestContactRev__c where TestContact__c in: tcid];

        if(!tcrlistexisting.isEmpty()){
            delete tcrlistexisting;
        }

        for(TestContact__c tc : trigid){
            Date sdate = tc.Expiration_Date__c;
            TestContactRev__c tcr = new TestContactRev__c();
            if(sdate.month() ==1 || sdate.month() == 2 || sdate.month() == 3)
            {
                tcr.Name = tc.Name + 'Quarter 1';
                tcr.TestContact__c = tc.Id;
            }
            else if(sdate.month() ==4 || sdate.month() == 5 || sdate.month() == 6)
            {
                tcr.Name = tc.Name + 'Quarter 2';
                tcr.TestContact__c = tc.Id;
            }
            tcrlist.add(tcr);
        }

        if(tcrlist.size() >0){
            insert tcrlist;
        }

    }  
}