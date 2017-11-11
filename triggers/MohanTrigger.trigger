trigger MohanTrigger on Account (after insert) {
    String username = userInfo.getFirstName();
    for(Account acc:Trigger.New){
    //  system.debug('No of contacts'+acc.);  
    }
}