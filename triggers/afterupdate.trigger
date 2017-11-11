trigger afterupdate on Account (before update, after update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        afterupdatetriggerexample.beforeupdate(Trigger.old);       
    }
    
}