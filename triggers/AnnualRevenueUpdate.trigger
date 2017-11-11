trigger AnnualRevenueUpdate on Account (after insert) {
	
    List<Account> acc = new List<Account>();
    List<Contact> c = new List<Contact>();
    for(Account a:Trigger.New){        
      	contact con = new contact();
        con.FirstName='Manish';
        con.Email='test@tyest.com';
        con.LastName = 'KKr';
        con.AccountId=a.Id;
        c.add(con);
    }
    insert c;
  
    
}