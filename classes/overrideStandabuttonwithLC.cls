public class overrideStandabuttonwithLC {    
    @AuraEnabled
    public static Id saveAccount(Account accRec){        
        insert accRec;
        return accRec.Id;
    }
}