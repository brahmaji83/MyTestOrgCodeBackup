public class parentchildsoql {
    public list<Account> acc {set; get;}
    public Boolean flag1 {set; get;}
    public Boolean flag2 {set; get;}
        public void standardobjectlookup(){
            flag1=true;
            flag2=false;
            acc = [select name, industry, (select firstname, lastname from contacts)contacts from Account];
        }
    	public void AccountOpportunities(){
        	flag1=false;
            flag2=true;
        	acc = [select name, industry, (select name, stagename from opportunities) from Account];
    }
}