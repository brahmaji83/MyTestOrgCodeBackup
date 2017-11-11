trigger trigger2 on Account (before update, after update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        triggerexample.beforeupdate(Trigger.old);
    }
    if(Trigger.isAfter && Trigger.isUpdate){
        triggerexample.afterupdate(Trigger.New);
    }
}