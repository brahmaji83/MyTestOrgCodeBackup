public class MohanWrapperTest {
    public List<WrapperTest> wt {get;set;}
    public List<WrapperTest> wts {get;set;}
    
    public MohanWrapperTest(){
        if(wt==null){
            wt = new List<WrapperTest>();
            List<Account> ac = new List<Account>();
            ac = [select id, name,industry from Account];
            system.debug('Size of the list'+ac.size());
			for(integer i=0;i<ac.size();i++)
            {
            	wt.add(new WrapperTest(String.valueOf((i+1)),ac[i]));
            }
        }
    }
    
    public pagereference SelectedAccount(){
        wts= new List<WrapperTest>();
        for(WrapperTest w:wt){
            
            if(w.b==true)
            {
            	system.debug(''+w.b);
                wts.add(w);
           	}    
        }
        system.debug('Size of wts'+wts.size());
        pagereference p =Page.MohanWrapperTestSelected;
        return p;   
    }
    
    public class WrapperTest{
        public boolean b {get;set;}
        public account acct {get;set;}
        public String sno {get;set;}
        
        public WrapperTest(String sno,Account acc){
            this.acct=acc;
            this.sno = sno;
            this.b = false;
        }
    }

}