global class BatchApex1Schedule implements Schedulable {
    
    global void execute(SchedulableContext sc){
        BatchApex1 ba = new BatchApex1();
        Database.executebatch(ba);
    }
}