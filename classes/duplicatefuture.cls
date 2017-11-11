public class duplicatefuture {
	@future
    public static void delduprec(List<Id> accList){
        List<Account> delaccList = [select id from Account where id in: accList];
        delete delaccList;
    }
}