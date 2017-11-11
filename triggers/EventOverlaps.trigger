trigger EventOverlaps on Event__c (before insert) {
    
    List<Event__c> ev = new List<Event__c>();
    List<Event__c> ev2 = new List<Event__c>();
    List<Event__c> ev3 = new List<Event__c>();
    List<Event__c> ev4 = new List<Event__c>();
    
    public datetime estartdate;
    public datetime eenddate;
    public string org;
    for(Event__c e: Trigger.New){
        estartdate = e.Start_Date__c;
        eenddate = e.End_Date__c;        
    }
    system.debug('Start'+estartdate);
    system.debug('end'+eenddate);
    
    ev = [select id from event__c where Start_Date__c <=:estartdate and End_Date__c>=:eenddate];
    ev2 = [select id from event__c where Start_Date__c <=:estartdate and End_Date__c>=:eenddate];
    ev3= [select id from event__c where Start_Date__c <=:estartdate and End_Date__c>=:eenddate];
    ev4 = [select id from event__c where Start_Date__c <=:estartdate and End_Date__c>=:eenddate];
    system.debug('size'+ev.size());
    for(Event__c e: Trigger.New){        
        for(Event__c eold:ev){
        	if(ev.size()>=1){   	        
                e.addError('Overllapped'+ev.get(0).Id+'eoldid '+eold.id);
            }
        }
    }
}