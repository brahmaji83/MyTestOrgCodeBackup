public with sharing class AccConWrapper {
    public string searchstring {get;set;}
    public List<wrapAcc> wralist {get;set;}
    public AccConWrapper() {
        
    }

    public void searchrecords(){
    	system.debug('called');
    	wralist = new List<wrapAcc>();
    	string searchtext = '%'+searchstring +'%' ;
        List<ApexClass> accList = [select id, Name from ApexClass where name like : searchtext];       
        List<ApexTrigger> conList = [select id, name from ApexTrigger where name like : searchtext];
        for(ApexClass a : accList){
            system.debug(a.name);
            wralist.add(new wrapAcc(a.name, 'ApexClass', a.Id));
           // wa = new wrapAcc(a.name, 'Account');
        }
        for(ApexTrigger  c: conList){
        //    system.debug(c.lastname);
            wralist.add(new wrapAcc(c.name, 'ApexTrigger', c.Id));
          //  wa = new wrapAcc(c.lastname, 'Contact');
        }

    }

    public class wrapAcc{       
        public string objectname {get;set;} 
        public String objdata {get;set;}
        public id objid {get;set;}
        public wrapAcc(String objname, String objd, Id objid){
        //    system.debug(objname +' '+objd);
            this.objectname = objname;
            this.objdata = objd;
            this.objid = objid;
        }
    }
}