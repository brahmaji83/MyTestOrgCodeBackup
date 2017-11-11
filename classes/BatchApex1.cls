global class BatchApex1 implements Database.Batchable<sObject> {
    
    global integer i=0;
    global Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([select id, name from account where name='test2']);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        
        List<Account> acc= new List<Account>();
        for(Account a:scope){
            a.name = 'test3';       		
            acc.add(a);
        }
        update acc;
        i = i+acc.size();
       
    }
    
    global void finish (Database.BatchableContext bc){
        system.debug('noofreocrdprocessed'+i);
    }

}