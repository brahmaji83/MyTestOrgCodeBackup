global class UpdateAccRelatedCon implements Database.Batchable<sObject>{
    
    global static Database.QueryLocator start(Database.BatchableContext BC){
        system.debug('start called');
        return Database.getQueryLocator([select Id, Phone,Fax, (select Id,Fax, Phone from contacts) from Account]);
    }
    
    global void execute (Database.BatchableContext BC, List<Account> accList){
        system.debug('execute called');
        List<contact> conList = new List<Contact>();        
        for(Account a : accList){
            for(Contact c: a.contacts){
                c.Fax = a.Fax;
                conList.add(c);
            }
        }
        update conList;
    }
    
    global void finish(Database.BatchableContext BC){
        system.debug('finsih called');
    }

}