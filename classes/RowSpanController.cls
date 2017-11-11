public class RowSpanController {
    public Map<String, List<RowSpanWrapper>> mapmodule {get;set;}
    public Map<String, Integer> modulecountmap {get;set;}
    public List<String> moduleList {get;set;}
    
    public RowSpanController(){
        mapmodule = new Map<String, List<RowSpanWrapper>>();
        modulecountmap = new Map<String, Integer>();
        moduleList = new List<String>();        
    }
    public void getdata(){
        List<RowSpan__c> rslist = [select Id, Module__c, First_Name__c, Last_Name__c, Email__c
                                  from RowSpan__c order by Module__c];
        for(RowSpan__c rs : rslist){
            List<RowSpanWrapper> rswrapperList = new List<RowSpanWrapper>();
            
            if(mapmodule.containsKey(rs.Module__c)){
                rswrapperList = mapmodule.get(rs.Module__c);
                rswrapperList.add(new RowSpanWrapper(rs));
                mapmodule.put(rs.Module__c, rswrapperList);
                modulecountmap.put(rs.Module__c, rswrapperList.size());
            }
            else{
                rswrapperList.add(new RowSpanWrapper(rs)); 
                mapmodule.put(rs.Module__c, rswrapperList);
                modulecountmap.put(rs.Module__c, rswrapperList.size());
            }
            
        }
        //moduleList = new List<String>(mapmodule.keySet());
        moduleList.addAll(mapmodule.keySet());
    }
    public class RowSpanWrapper{
        public String fname {get;set;}
        public String lname {get;set;}
        public String rsemail {get;set;}
        public String rsmodule {get;set;}
        public RowSpanWrapper(RowSpan__c r){
            this.fname = r.First_Name__c;
            this.lname = r.Last_Name__c;
            this.rsemail = r.Email__c;
            this.rsmodule = r.Module__c;
            
        }
    }
    
}