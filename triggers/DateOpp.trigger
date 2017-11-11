trigger DateOpp on Opportunity (before insert) {
	integer mm = date.today().month(); // To get the month of today
    integer dd = date.today().day(); // To get the day of today
    integer yy = date.today().year(); // To get the year of today
    system.debug('mm/dd/yy'+mm+dd+yy);
    integer q; // To store the quarter
    
    // Quarter number based on month
    if((mm==1) || (mm==2) || (mm==3)){
        system.debug('first quarter');
        q=1;
    }
    else if((mm==4) || (mm==5) || (mm==6)){
        system.debug('second quarter');
        q=2;
    }
    else if((mm==7) || (mm==8) || (mm==9)){
        system.debug('third quarter');
        q=3;
    }
    else{
        system.debug('fourth quarter');        
        q=4;
    }
    
    
    List<Opportunity> op = [select id from Opportunity where createddate=today]; // To get the count of Opportunities created today
    integer count = op.size()+1; //Note: If you are using before insert, add +1 else you can leave as it is
    String sCount = String.valueOf(count); // To convert integer to String
    if(scount.length()==1){ // To format the count in 3 digits
        sCount = '00'+sCount;
    }
    else if(sCount.length()==2){
        sCount = '0'+sCount;
    }
    
    // To convert integer to string
    String yyyy = string.valueOf(yy);
    String yy2 = yyyy.substring(2,4); //To get the last 2 digits of year
    
    string format = string.valueOf(q)+sCount+yy2+string.valueOf(mm)+string.valueOf(dd); // Concatenate all the strings
    system.debug('format'+format);
    
    for(Opportunity o:Trigger.New){
		o.OrderNumber__c = format; // Just update the final string into some field, thats it
    }
}