trigger Sendemailtocontacts on Account (after update) {
    
    List<String> ls = new List<String>();
    set<String> st = new Set<String>();
    List<Contact> lc = new List<Contact>();
    id accountid;

    for(contact con : [select id,email,accountid from contact where accountid in :Trigger.New]){
        //ls.add(con.Email);
        accountid = con.AccountId;
        if(con.Email<>null){
            st.add(con.email);
        }
        system.debug('noofemails'+st.size());
        
    }
    ls.addAll(st);
    if(ls.size()>0){
        system.debug('noofemailsls'+ls.size());        
        Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
        semail.setToAddresses(ls);
        semail.setPlainTextBody('You account'+accountid+' is updated');
        semail.setSubject('Account update');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{semail});
    }

}