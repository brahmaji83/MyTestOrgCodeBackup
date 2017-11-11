global class BatchAccountUpdate implements Database.Batchable <sObject> {
    
    global integer recordsprocessed = 0;
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('start');
        return Database.getQueryLocator([select Id, Industry from Account where industry = 'Banking']);
    }
    
    global void execute ( Database.BatchableContext BC, List<Account> scope){
        
        List<Account> acc = new List<Account>();
        
        for(Account a:scope){
            a.Industry = 'Environmental';
       		system.debug('entered execute');
            
            acc.add(a);
        }
        system.debug('entered execute');
        update acc;
    }
    
    global void finish (Database.BatchableContext BC){
        system.debug('entered here');
    }

}