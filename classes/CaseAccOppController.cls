public class CaseAccOppController {

	public List<Opportunity> getOppList() {
	//	Id caseid = ApexPages.currentpage().getParameters().get(Id);
		Case c = [select id,Accountid from Case where id =: ApexPages.currentPage().getParameters().get('id')];
		return [select id, name from Opportunity where accountid =: c.AccountId];
	}
}