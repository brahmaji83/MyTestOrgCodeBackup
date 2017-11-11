public class ImportDataController {
    public blob impdata {get;set;}
    public List<String> impdatastr {get;set;}
    public String impdatabody {get;set;}
    public List<Account> accList {get;set;}
    
    
    public ImportDataController(){
        impdatastr = new List<String>();  
        accList = new List<Account>();
    }
    public void ImportDataControllerNow(){
        if( impdatabody.split('\\.')[1] != 'csv')
            {
                ApexPages.addMessage(new ApexPages.message(
            						ApexPages.Severity.ERROR, 'File is not in csv format'+ 
                    'and name should not contain dots'));	                
            }
        else{
                    
            try{
                system.debug('file name '+impdatabody);            
                impdatabody = impdata.toString();
                system.debug('debug 1');
                impdatastr = impdatabody.split('\n');
                system.debug('debug 2');
                for(integer i=0; i<impdatastr.size();i++){
                    system.debug('debug 3');
                    Account a = new Account();
                    List<String> adata = new List<String>();
                    adata = impdatastr[i].split(',');
                    system.debug('debug 4');
                    a.Name = adata[0];
                    a.Industry = adata[1];            
                 //   a.AnnualRevenue= Decimal.valueOf(adata[2]);                
                    system.debug('debug 5');
                    accList.add(a);
                }
                insert accList;
                ApexPages.addMessage(new ApexPages.message(
                                        ApexPages.Severity.CONFIRM, 'Successfully uploaded'));
            }
            catch(Exception e){
                system.debug('Exception here '+e);
                ApexPages.addMessage( new ApexPages.Message
                                     (ApexPages.Severity.ERROR, 'Something is wrong with attachment'));            
            }
        }
    }

}