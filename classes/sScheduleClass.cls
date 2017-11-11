global class sScheduleClass implements Schedulable {
    global void execute(SchedulableContext SC){
        Account a = new Account();
        a.name = 'Scheduleclass';
        insert a;
        system.debug('accountid '+a.id);
    }
}