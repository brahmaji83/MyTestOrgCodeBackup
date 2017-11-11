trigger phonedigit on Contact (before insert,before update) {
    for(Contact con:Trigger.New){
        string vphone = con.phone;
        integer n = 0;
        if(vphone != null)
            n = vphone.length();
    //    long n = Integer.valueof(vphone.trim());
        if(n > 10){
            con.addError('exceeds 10 digits');
        }
        system.debug('phone'+vphone+n);
    }
}