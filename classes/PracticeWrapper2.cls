public class PracticeWrapper2 {
    public List<WrapperAcc> wacc {get;set;}
    public PracticeWrapper2(){
        wacc = new List<WrapperAcc>();
        List<Account> accList = new list<Account>([select Id, Name from Account]);
        for(integer i=0;i<accList.size();i++){
            boolean check = false;
            wacc.add(new WrapperAcc(check, accList[i], String.valueOf(i+1)));
        }
    }
    
    public class WrapperAcc{
        public Account a{get;set;}
        public boolean b{get;set;}
        public String s{get;set;}
        
        public WrapperAcc(boolean bp, Account ap, string sp){
            this.a = ap;
            this.b = bp;
            this.s = sp;
        }
    }

}