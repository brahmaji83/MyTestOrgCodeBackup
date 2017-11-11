public class WrapperClass {
    public List<WrapperClassexample> listwrapper {get;set;}
    public wrapperclass(){
        List<Account> acc = [select name from account limit 10];
        if(acc.size()>0){
            listwrapper = new List<WrapperClassexample>();
            for(account a : acc){
                listwrapper.add(new WrapperClassexample(a));
            }
        }
    }
    public class WrapperClassexample{
        public account acct{get;set;}
        public boolean checkbool {get;set;}
            
        public WrapperClassexample(Account acct){	
        	this.acct = acct;
        }
    }

}