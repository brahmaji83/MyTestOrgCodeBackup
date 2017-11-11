public class CountOfCases {
    
    List<Case> ccase = new List<Case>();
    public Integer cnewcount;
    public Integer cWorkingcount;
    public Integer cClosedcount;
    public Integer cEscalatedcount;
    List<AggregateResult> agr = new List<AggregateResult>();
    Integer casecount;
    
    public void getcount(){
        system.debug('entered method');        
	    agr = [select count(id) total, Status from Case group by Status];
        for(AggregateResult a: agr){
            if(a.get('Status')=='New'){
                cnewcount = (Integer) a.get('total');
                system.debug('new cases '+cnewcount);
            }
            if(a.get('Status')=='Working'){
                cWorkingcount = (Integer) a.get('total');
                system.debug('cWorkingcount cases '+cWorkingcount);
            }
            if(a.get('Status')=='Closed'){
                cClosedcount = (Integer) a.get('total');
                system.debug('cClosedcount cases '+cClosedcount);
            }
            if(a.get('Status')=='Escalated'){
                cEscalatedcount = (Integer) a.get('total');
                system.debug('cEscalatedcount cases '+cEscalatedcount);
            }
        }  
        sendemail();
    }
//    public String snewcount1 = (String) cnewcount;
    
    public void sendemail(){
    	String snewcount = 'New Cases: '+String.valueOf(cnewcount);
        Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage(); 
        List<String> addr = new List<String>{'brahmaji83@gmail.com'};
        email.toaddresses = addr;
        email.setSubject('Case Report');
        email.setPlainTextBody(snewcount);
		Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email}); 
    }
    

}