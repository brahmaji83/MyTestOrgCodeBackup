public class GetterSetter {
    
    public String myname;
    public String myCompany;

    public String getmyname(){
        system.debug('1');
    	myname='Manish';
        return myname;
    }
    
    public String getmyCompany(){
        system.debug('2');
    	myCompany='West';
        return myCompany;
    }
	
    public void setmyname(){
        system.debug('3');
        myname='Brahma';
    }
    
    public Void setmyCompany(){ 
        system.debug('4');
        myCompany='CTS';
    }
    
    public void accsearch(){
        List<Account> acct = [select id from Account];
        system.debug('size of acct '+acct.size());
        system.debug(myname+mycompany);
    }
    
}