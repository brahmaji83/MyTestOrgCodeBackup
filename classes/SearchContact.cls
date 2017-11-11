public class SearchContact {
    public List<Contact> con {get;set;}
    public string lastname {get;set;}
    public string email {get;set;}
    public boolean rend {get;set;}
    public boolean csize {get;set;}
    public boolean cavail {get;set;}
    public contact c{get;set;}
    public searchcontact(){
        rend=false;
        cavail = false;
    }
    public pagereference searchcon(){
        con = [select lastname,email,id from contact where lastname=:lastname];
        rend=true;
        if(con.size()<1){
            csize= true;
        }
        return null;
    }
    public pagereference checkavailabl(){
        con = [select lastname,email,id from contact where lastname=:lastname];
        if(con.size()>0){
            cavail = true;           
			csize= true;
            rend = true;
        }
        else{
            cavail=false;
        }
        system.debug('sizeofcon'+con.size());
        return null;
    }
	
    public pagereference create(){
        c =new contact();
        c.lastname=lastname;
        insert c;
        return page.Mohanwrappertest;
        
    }
    
    public pagereference processselected(){
        return null;
    }
}