public class soql2 {
    public List<Opportunity> opp {Set;get;}
    public void soql2(){
        opp = [select name, id, closedate, createddate, amount from Opportunity];
    }
    public void soqltoday(){
        opp = [select name, id, closedate, createddate, amount from opportunity where createddate >=TODAY];
    }
     
}