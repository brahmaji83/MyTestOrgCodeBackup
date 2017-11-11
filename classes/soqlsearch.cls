public class soqlsearch {
    public List<Account> acc {set; get;}
    public string accname {set; get;}
    public string industry {set; get;}
    public void search(){
        acc = [select name, industry, id, createddate from Account where name=:accname and industry =:industry];
    }
    public void dynamicsearch(){
        String query = 'select name, industry from Account ';
        if((accname!=null && accname!='') && (industry != null && industry!= ''))
        {
            query = query+' where name=\''+accname+'\' and industry =\''+industry+'\'';
        }else{
            if((accname!=null && accname!='')){
                query = query+'where name=\''+accname+'\'';
            }else{
                if(industry != null && industry!= ''){
                    query = query + ' where industry =\''+industry+'\'';
                }else{
                    query = query;
                }
            }
        }
        acc = Database.query(query);
    }

}