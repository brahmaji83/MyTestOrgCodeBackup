trigger Discountinsert on Pizza_Ordering__c (before update) {

    //Pizza_Ordering__c [] disc = Trigger.New;
    //discount.applydiscount(disc);
    for (Pizza_Ordering__c a : Trigger.New)
    {
       // Pizza_Ordering__c a =new Pizza_Ordering__c ();
        a.Email_Id__c= 'brahmaji83@gmail.com';
    }
    
 //   Pizza_Ordering__c c = new List<Pizza_Ordering__c>();
  /*  Pizza_Ordering__c d = [Select Id,Email_Id__c from Pizza_Ordering__c where Name='Ord47'];
    d.Email_Id__c='india@test.com';
    update d;*/
}