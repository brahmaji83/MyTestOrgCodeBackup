public class c1{
    List<Opportunity> Opt = [select name, CloseDate, Amount, ExpectedRevenue from Opportunity];
    
    public List<Opportunity> getopt(){
    return Opt;
    }
}