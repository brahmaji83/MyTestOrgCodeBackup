public class CalendarExample_Controller {
    public boolean includeMyEvents {get;set;}
    public list<calEvent> events {get;set;}
	String dtFormat = 'EEE, d MMM yyyy HH:mm:ss z';
    
    public CalendarExample_Controller() {
		includeMyEvents = true;
    }
    
    public PageReference pageLoad() {
        events = new list<calEvent>();
        for(Contact cont : [select id, Birthdate, FirstName, LastName from Contact where Birthdate != null]){
			system.debug('############entered in pageload');
//here we need to replace the birth year with the current year so that it will show up on this years calendar            
            DateTime startDT = DateTime.newInstance(Date.today().year(), cont.Birthdate.Month(), cont.Birthdate.Day());
			calEvent bday = new calEvent();
			bday.title = cont.FirstName + '' + cont.LastName + '\'s Birthday!';
			bday.allDay = true;
			bday.startString = startDT.format(dtFormat);
			//Because this is an all day event that only spans one day, we can leave the send date null
			bday.endString = '';
			bday.url = '/' + cont.Id;
			bday.className = 'event-birthday';
			events.add(bday);
		}
	//Get Campaigns
		for(Campaign camp : [select Id, Name, StartDate, EndDate from Campaign where IsActive = true]){
			DateTime startDT = camp.StartDate;
			DateTime endDT = camp.EndDate;
			calEvent campEvent = new calEvent();
			campEvent.title = camp.Name;
			campEvent.allDay = true;
			campEvent.startString = startDT.format(dtFormat);
            campEvent.endString = endDT.format(dtFormat);
            campEvent.url = '/' + camp.Id;
            campEvent.className = 'event-campaign';
            events.add(campEvent);
		}
		//Get my Events if we have selected the correct option
		if(includeMyEvents){
            for(Event evnt: [select Id, Subject, isAllDayEvent, StartDateTime, EndDateTime from Event where OwnerID = :UserInfo.getUserId()]){
                DateTime startDT = evnt.StartDateTime;
                DateTime endDT = evnt.EndDateTime;
                calEvent myEvent = new calEvent();
                myEvent.title = evnt.Subject;
                myEvent.allDay = evnt.isAllDayEvent;
                myEvent.startString = startDT.format(dtFormat);
                myEvent.endString = endDT.format(dtFormat);
                myEvent.url = '/'+ evnt.Id;
                myEvent.className = 'event-personal';
                events.add(myEvent);
            }
        }
        return null;
    }

	public PageReference toggleMyEvents() {
        if(includeMyEvents){
            includeMyEvents = false;
        }
        else{
            includeMyEvents = true;
        }
        pageload();
        return null;
	}
	
    //Class to hold calendar event data
	public class calEvent{
        public String title {get;set;}
        public Boolean allDay {get;set;}
        public String startString {get;set;}
        public String endString {get;set;}
        public String url {get;set;}
        public String className {get;set;}
	}
}