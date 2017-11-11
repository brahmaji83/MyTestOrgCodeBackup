public class listofrelatedrecords {
    public List<Account> lacc {get;set;}
    
    public listofrelatedrecords(){
        lacc = [select id, name, (select id,name from contacts), (select id,name from Opportunities) from Account limit 15];
    }
}