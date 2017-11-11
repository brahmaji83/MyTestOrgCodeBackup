public class AccountContactrelation {

    public List<Account> acc {get;set;}
    
    public AccountContactrelation(){
        acc = [select id,name, industry, (select lastname, name, id from contacts) from Account order by createddate desc];
    }


}







/*    public List<WrapAcc> WrapAcclist {get;set;}
    
    public AccountContactrelation(){
        if(WrapAcclist == null){
            WrapAcclist = new List<WrapAcc>();
            for(Account a:[select name, id, (select id,name,lastname from contacts) from Account order by createddate desc limit 10]){
                WrapAcclist.add(new WrapAcc(a));
            }
        }
    }
    
    
    public class WrapAcc{
        public Account acc {get;set;}
        public contact con {get;set;}
        public WrapAcc(Account ac){
            acc=ac;
          //  if(ac.contacts.size()>0){
			con = ac.contacts;
            // }
            
        }
    }

}


*/