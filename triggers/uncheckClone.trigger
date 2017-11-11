trigger uncheckClone on Account (before insert) {

    for(Account a: Trigger.New){
        if(a.Clone__c == true){
            a.Clone__c = false;
        }
    }

}