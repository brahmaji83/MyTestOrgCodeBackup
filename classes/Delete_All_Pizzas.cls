global class Delete_All_Pizzas implements Database.Batchable<sObject>, Database.Stateful{
	global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            [select id from Pizza_Ordering__c]
        );
    }
    global void execute(Database.BatchableContext bc, List<Pizza_Ordering__c> scope){
        // process each batch of records
        List<Pizza_Ordering__c> Pizzas = new List<Pizza_Ordering__c>();
        for(Pizza_Ordering__c ld : scope){
          //  ld.LeadSource = 'Dreamforce';
            Pizzas.add(ld);
            recordsProcessed = recordsProcessed + 1;
        }
        delete Pizzas;        
    }
    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
     //   EmailUtils.sendMessage(a, recordsProcessed);
    }   
}