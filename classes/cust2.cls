public class cust2 {
    List<Opportunity> opps = [select name, amount, expectedrevenue, StageName,CloseDate from opportunity];
    public List<Opportunity> getopps(){
        return opps;
    }
}