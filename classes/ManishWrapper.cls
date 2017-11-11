public class ManishWrapper {
    
    public List<MWrapper> mw {get;set;}
    public List<MWrapper> mwselected {get;set;}
    public List<Contact> conList {get;set;}
    public ManishWrapper(){
        mw = new List<MWrapper>();
        mwselected = new List<MWrapper>();
        conList = new List<Contact>();
        boolean check = false;
        for(Account a:[select Id, Name from Account]){
            mw.add(new MWrapper(check, a));
        }
    }
    
    public class MWrapper{
        public boolean sbutton{get;set;}
        public Account acc {get;set;}
        
        public MWrapper(boolean b, Account a){
            this.sbutton = b;
            this.acc = a;
        }
    }    
    public pagereference createAcontact(){
        system.debug('entered in createac');
        for(MWrapper m: mw){
            if(m.sbutton == true){
                system.debug('entered in if condition');
                mwselected.add(m);
                system.debug('value selected'+m.sbutton);
            }
        }
        if(!mwselected.isEmpty()){
            for(MWrapper ms:mwselected ){
                contact c = new contact();
                c.LastName = ms.acc.name;
                c.AccountId = ms.acc.Id;
                system.debug('entered in mwselected');
                conList.add(c);
            }
        }
        insert conList;
        return null;
    }
}