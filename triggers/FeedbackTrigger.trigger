trigger FeedbackTrigger on Feedback__c (before insert, before update) {
    for(Feedback__c f: Trigger.New)
    {
        Integer x = Integer.valueOf(f.Q1__c);
        Integer y = Integer.valueOf(f.Are__c); //To convert a string to Integer in SF apex       
        x = x*20;
        y = y*20;
        f.Overall_Percentage__c = ((x+y)/2);
        //int t = f.Q1__c;
    }

}