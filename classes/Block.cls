public class Block {

   List<Account> accts;
   public boolean B1 {get;set;}
   public boolean B2 {get;set;}   
  
  public Block(){
     B1 = false;
     }
    
    public List<Account> getaccts(){
    
        return accts;
    }
    
    public PageReference Prospect(){
        accts = [select name, type, industry from Account where type='Customer - Direct'];
        B1 = true;
       B2=true;
        return null;
    }
    public PageReference Customer() {
    accts = [select name, type, industry from Account where type='Customer - Channel'];
    B1 = true;
        return null;
    }    
    
}