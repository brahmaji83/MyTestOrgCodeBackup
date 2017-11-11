public with sharing class AccountPagination {
    private final account acc;
    public AccountPagination(ApexPages.StandardSetController setCon){
        this.acc = (Account)setCon.getRecord();
    }
    
    public ApexPages.StandardSetController accountRecords{
        get{
            if(accountRecords == null){
                accountRecords = new ApexPages.StandardSetController(Database.getQueryLocator([select name, id from Account]));
            }
            return accountRecords;
        }
        private set;
    }
    public List<Account> getAccountPagination(){
        return (List<Account>) accountRecords.getRecords();
    }
    
}