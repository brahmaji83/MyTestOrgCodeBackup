@isTest
public class Test_primarycheck 
{
    public static testmethod void  createAcc(){
        Account a = new Account();
        a.Name = 'test';
        insert a;

		List<Contact> conlist = new List<Contact>();
        Contact  c1 = new contact();
        c1.lastname = 'test1';
        c1.email = 'test@test.com';
        c1.primary__c = true;
        c1.accountid = a.id;
        c1.Birthdate = date.today();
        try{
        	insert c1;
		}
        catch(Exception e){
            system.debug('first exception '+e.getMessage());
        }
        conlist.add(c1);

        contact c2 = new contact();
        c2.lastname = 'test2';
        c2.email = 'test@test.com';
        c2.primary__c = true;
        c2.AccountId = a.Id;
        c2.Birthdate = date.today();
        Test.startTest();
        try{
        	insert c2;
		}
        catch(Exception e){
            system.debug('message is '+e.getMessage());
           // system.assertEquals('bad', e.getMessage());
        }
        Test.stopTest();
        
  //      List<Contact> conlist = new List<Contact>();
        Contact  c3 = new contact();
        c3.lastname = 'test1';
        c3.email = 'test@test.com';
        c3.primary__c = true;
        c3.accountid = a.id;
        c3.Birthdate = date.today();
        
        List<Contact> contoupd = new List<Contact>();
        contoupd.add(c3);
        
    //    List<Contact> conlist = new List<Contact>();
        Contact  c4 = new contact();
        c4.lastname = 'test1';
        c4.email = 'test@test.com';
        c4.primary__c = true;
        c4.accountid = a.id;
        c4.Birthdate = date.today();
        contoupd.add(c4);
        
        try{
            insert contoupd;
        }
        catch(Exception e){
            //system.assertEquals('bad', e.getMessage());
        }
        //system.debug([select primary__c from contact]);
        List<AggregateResult> aggr = [select count(id), accountid from contact where primary__c = true group by accountid];
        system.debug(aggr);
        //system.assertEquals(aggr[0].get(0), 1);
    }    
}