public class SampleAccount {
    public Account acc {get;set;}
    public sampleaccount(){
        acc = new Account();
    }
    
    public pagereference insertacc(){
        if (acc.industry==null){
            acc.industry.addError('Please fill this');        
            return null;
        }   
        else{
            insert acc;
            pagereference pg = new pagereference('/'+acc.id);
            pg.setRedirect(true);                
            return pg;
        }
    }
}