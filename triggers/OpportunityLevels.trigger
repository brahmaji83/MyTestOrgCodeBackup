trigger OpportunityLevels on Opportunity (before update) {
    // List<String> s = new List<String>();
    
    for(Opportunity o:Trigger.New){
        Opportunity op = Trigger.oldmap.get(o.Id);
        if(op.Level__c!=null){
        	boolean lvl1 = op.Level__c.equals('Level1');
        	boolean lvl2 = o.Level__c.equals('Level3');
        	system.debug('Resume'+lvl1);
        	system.debug('Resume2'+lvl2);
        	if(lvl1 && lvl2){
            	o.addError('Terst');
        	}
        }    
    }

}