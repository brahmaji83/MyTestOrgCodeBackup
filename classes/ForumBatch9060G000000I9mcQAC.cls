global class ForumBatch9060G000000I9mcQAC implements Database.Batchable <sObject>{
    
    global Map<Id, List<Account>> accMap = new Map<Id, List<Account>>();
    global Map<Id, Id> accMapId = new Map<Id, Id>();
    global Map<Id, List<Contact>> accConMap = new Map<Id, List<Contact>>();
    global List<Contact> newConList = new List<Contact>();
    
    global Database.QueryLocator start (Database.BatchableContext BC){
        return Database.getQueryLocator([select Id,OldAccNum__c from Account where OldAccNum__c != null]);
    }
    
    global void execute (Database.BatchableContext BC, List<Account> accList){
        system.debug('entered execute');
        for(Account a: accList){
            system.debug('entered first for');
            accMapId.put(a.Id, Id.valueOf(a.OldAccNum__c) );
        }
        List<Account> oldAccCon = [select Id, (select Id, LastName, FirstName, Email from Contacts) from Account where id in: accMapId.values()];
        system.debug('finished first for');
        for(Account a : oldAccCon){
            accConMap.put(a.Id, a.Contacts);
            system.debug('entered second for');
        }
        
        for(Account a : accList){
            system.debug('entered thrid for');
            for(Contact c: accConMap.get(accMapId.get(a.Id))){
                system.debug('entered thrid innder for');
                Contact cnew = new Contact();
                cnew.AccountId = a.Id;
                cnew.LastName = c.LastName;
                cnew.FirstName = c.FirstName;
                cnew.Email = c.Email;
                newConList.add(cnew);
            }
        }
        if(!newConList.isEmpty()){
            insert newConList;
        }
    }
    global void finish(Database.BatchableContext BC){
        system.debug('finsh');
    }
    	

}