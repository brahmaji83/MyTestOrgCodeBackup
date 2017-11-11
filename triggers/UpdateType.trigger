trigger UpdateType on Project__c (before insert, before update) {
	public String pvalue ;	
    for(Project__c p : Trigger.New){
        if(p.Priority__c =='High'){
            pvalue = '';
            String ptype = p.Type__c;            
            String[] ptypevalues = ptype.split(';');
            List<String> pvalidvalues = new List<String>();
            for(String a : ptypevalues){
                if(a == 'Networks'){
                    pvalidvalues.add('Infrastructure');
                }
                if(a <> 'Networks'){
                    pvalidvalues.add(a);
                }
            }
            if(pvalidvalues.size()>0){
                
                for(String ps : pvalidvalues){
                    pvalue = pvalue + ps + '; ';
                }
            }
            system.debug('all valid values '+ptypevalues);
            system.debug('all valid values '+pvalidvalues);
            system.debug('all valid values '+pvalue);
            p.Type__c = pvalue;
        }
    }
    
}