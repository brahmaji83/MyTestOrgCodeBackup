public class PracticeWrapper {
    
    public List<WrapperAccountCheck> wrpAcc {get;set;}
    public List<WrapperAccountCheck> wrpAccSelected {get;set;}
    public List<Account> accList {get;set;}
    public PracticeWrapper(){
        wrpAcc = new List<WrapperAccountCheck>();
        system.debug('called again');
        wrpAccSelected = new List<WrapperAccountCheck>();
        accList = new List<Account>([select Id, Name, industry from Account]);
        
        for(integer i =0; i<accList.size();i++){
            boolean check = false;
            if(accList[i].industry == 'Banking')
                check =true;
            wrpAcc.add(new WrapperAccountCheck(check, String.valueOf(i+1), accList[i]));
        }
    }
    public pagereference save(){
        update accList;
        return null;
    }
    
    public pagereference wrpselected(){
        wrpAccSelected = new List<WrapperAccountCheck>();
        system.debug('pagereference');
        for(WrapperAccountCheck w:wrpAcc){
            if(w.checkbox == true){
                wrpAccSelected.add(w);
                system.debug('entred if');
            }
        }
        system.debug('size of list '+wrpAccSelected.size()+ wrpAccSelected);
        pagereference p = Page.PracticeWrapperDemo;
        return p;
    }
	
    public class WrapperAccountCheck{
        public boolean checkbox {get;set;}
        public String slno {get;set;}
        public Account acc {get;set;}
        
        public WrapperAccountCheck(){
            
        }
        
        public WrapperAccountCheck(boolean c, String s, Account a ){
            this.checkbox = c;
            this.slno = s;
            this.acc = a;
            
        }
        public WrapperAccountCheck(String s, Account a){
            this.checkbox = false;
            this.slno = s;
            this.acc = a;
        }
    }
}