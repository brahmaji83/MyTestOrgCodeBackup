public class AccountLIstLCController {
    @AuraEnabled
    public static List<Account> getAccRecords(){
        
        return [select Id, Name, Industry from Account limit 10];
    }
    
    @AuraEnabled
    public static Account getAcc(Id accId){
        return [select Id, Name, Industry, Type from Account where Id=: accId];
    }

    @AuraEnabled
    public static List<Map<String, Object>> getData(){
        List<Map<String, Object>> lstRec = new List<Map<String, Object>>();
        for(Account a : [select Id, Name, Industry from Account limit 10]){
            lstRec.add(new Map<String, Object>{
                'label' => a,
                    'Singature' => a.Name
            });
        }
        return lstRec;
    }
        
}