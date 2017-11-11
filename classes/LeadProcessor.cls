global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful{
	global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            [select id, LeadSource from lead]
        );
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> Leads = new List<Lead>();
        for(Lead ld : scope){
            ld.LeadSource = 'Dreamforce';
            leads.add(ld);
            recordsProcessed = recordsProcessed + 1;
        }
        update leads;        
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