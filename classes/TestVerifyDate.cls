@isTest
public class TestVerifyDate {
    @isTest static void testdatemethod(){
        Date vdt1 = date.newInstance(2016, 12, 12);
        Date vdt2 = date.newInstance(2016, 12, 13);
        Date vresult = VerifyDate.CheckDates(vdt1,vdt2);
        system.assertEquals(vdt2, vresult);
    }
    @isTest static void testdatemethod2(){
        Date vdt3 = date.newInstance(2016, 12, 12);
        Date vdt4 = date.newInstance(2016, 12, 10);
        date vresult2 = VerifyDate.CheckDates(vdt3,vdt4);
        Integer mth =  vresult2.day();
        system.assertEquals(31, mth);
    }    
}