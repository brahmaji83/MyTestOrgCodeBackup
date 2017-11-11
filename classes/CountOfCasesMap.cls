public class CountOfCasesMap {
    
    public Map<Id, String> mcase = new Map<Id, String>();
    
    public void getcasecount(){
        List<Case> lcase1 = [select id, Status from Case where Status='New'];                
        List<Case> lcase2= [select id, Status from Case where Status='Closed'];                
        List<Case> lcase3 = [select id, Status from Case where Status='Working'];                
        List<Case> lcase4 = [select id, Status from Case where Status='Escalated'];                
		Integer lcasecount1 = lcase1.size();
        Integer lcasecount2 = lcase2.size();
        Integer lcasecount3 = lcase3.size();
        Integer lcasecount4 = lcase4.size();
        system.debug('counto'+lcasecount1+'casse '+lcasecount2+lcasecount3+lcasecount4);
    }

}