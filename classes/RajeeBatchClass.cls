global class RajeeBatchClass implements Database.Batchable <sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select id, Industry from Account limit 10]);
    }
    
    global void execute (Database.BatchableContext bc, List<Account> scope){
        for(Account a : scope){
            system.debug('entered here');
        }
    }
    global void finish(Database.BatchableContext BC){
        system.debug('entered finish method');
    }    
}