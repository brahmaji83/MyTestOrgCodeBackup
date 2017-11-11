trigger T1 on Pizza_Ordering__c (after update, after insert) {

    for (Pizza_Ordering__c p: Trigger.New)
    {
         boolean b;
            
         if(p.Coupon_Code__c!='50OFF')
         {
             p.addError('Coupon is not valid, please remove to submit your order');
         }
    } 

}