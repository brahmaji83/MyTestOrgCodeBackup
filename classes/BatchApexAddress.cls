global class BatchApexAddress implements Database.Batchable<sObject> {
    global integer noofrecords = 0;
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([select id from Address__c]);
    }
        
    global void execute (Database.BatchableContext BC, List<Address__c> scope){
        List<Address__c> addr = new List<Address__c>();
        for(Address__c a:scope){            
            addr.add(a);
            system.debug('entered');
            noofrecords=noofrecords+1;
        }
        system.debug('addr size'+addr.size());
        delete addr;
    }
    
    global void finish(Database.BatchableContext BC){
        system.debug('number of records processed'+noofrecords);
    }
}