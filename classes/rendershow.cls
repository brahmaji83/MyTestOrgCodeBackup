public class rendershow {

    public boolean block1 {get;set;}
    public boolean block2 {get;set;}
    
    public rendershow(){
       block1 = false;
       block2 = false;
       }
    
    public List<string> myCheckValue {set; get;}
    
    public pagereference setFlag(){
        if(myCheckValue[0] == 'check1' && myCheckValue[1] == 'check2' ) { 
        block1=true; block2=true;}
        else { block2= false; block1=false;}
        return null;
        }    
}