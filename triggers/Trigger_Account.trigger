trigger Trigger_Account on Account (before update) {
    
    for(Account a:Trigger.New){
        if(a.name=='Brahmaji'){
            a.industry='Banking';
        }
    }

}