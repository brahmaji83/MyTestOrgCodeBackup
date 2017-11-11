public with sharing class forumcontrollerclass {

    public List<SelectOption> getDaysOfWeek() {
        List<SelectOption> days = new list<SelectOption>();
        days.add(new SelectOption('Mon', 'Mon'));
        days.add(new SelectOption('Tue', 'Tue'));
        days.add(new SelectOption('Wed', 'Wed'));
        days.add(new SelectOption('Thu', 'Thu'));
        days.add(new SelectOption('Fri', 'Fri'));
        return days;
    }

    public transient String dow {get;set;}
      /*
        get {
            if (dow == null) {
                dow = 'Mon';
            }
            return dow;
        }
        set {dow = value;}

    }
*/
    public forumcontrollerclass(){
        if(dow == null){
            dow = 'Mon';
        }       
    }
}