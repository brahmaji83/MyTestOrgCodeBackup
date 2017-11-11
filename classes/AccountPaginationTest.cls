@isTest
public class AccountPaginationTest {
    static testmethod void paginationtest(){
		pagereference pageref = Page.PaginationUsingExtension;
        Test.setCurrentPage(pageref);        
        List<Account> ac = [select name, id from Account];
        ApexPages.StandardSetController assc = new Apexpages.StandardSetController(ac);
        AccountPagination ap = new AccountPagination(assc);
        
        ap.getAccountPagination();
        
    }
}