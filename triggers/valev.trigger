trigger valev on Event__c (before insert) {
    List<Event__c> ev = new List<Event__c>();
	ev = [select name from Event__c];
    for(Event__c evs: ev){
        
    }
}