global class DailyLeadProcessor implements Schedulable  {
    global void execute(SchedulableContext ctx) {
    	List<Lead> leads = [select id from lead where leadsource ='' limit 200];
        List<Lead> ulead = new List<Lead>();
        for(Lead ld:leads){
            ld.leadsource = 'Dreamforce';
            ulead.add(ld);
        }
        update ulead;
    }        
}