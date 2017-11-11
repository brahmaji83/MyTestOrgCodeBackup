trigger Account_ContactCreation on Account (after insert) {
    Org_Settings__c org = Org_Settings__c.getinstance('Settings1');
    boolean oswitch = org.Trigger_Switch__c;
    system.debug('Trigger Swithc'+oswitch);
    if(oswitch==true){
        for(Account acc:Trigger.New){
            Contact con = new contact();
            con.lastname = acc.name;
            con.accountid = acc.id;
            insert con;
        }
	}
}