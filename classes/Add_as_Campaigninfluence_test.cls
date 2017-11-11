@isTest(SeeAllData=true)
public class Add_as_Campaigninfluence_test { 
    
    public static testmethod void unitTest(){
        Lead leadObj1 = new lead(lastname = 'Rahul',company='goggle');
       Add_as_Campaigninfluence_test objC = new Add_as_Campaigninfluence_test();
        insert leadObj1;
        
        Lead uget=[select company from Lead where lastname='Rahul'];
        uget.LastName='testing';
        system.debug('before update uget');
      //  update uget;
        system.debug('after update uget');
        database.LeadConvert lc = new database.LeadConvert();
        lc.setLeadId(leadObj1.Id);
        LeadStatus convertStatus = [Select Id, MasterLabel from LeadStatus where IsConverted=true limit 1];
        lc.setConvertedStatus(convertStatus.MasterLabel);
        
        Database.LeadConvertResult lcr = Database.convertLead(lc);
        System.assert(lcr.isSuccess());
        if(leadObj1.IsConverted){
            Campaigninfluence li =new Campaigninfluence();
            li.CampaignId = '70128000001EFdg';
            li.ContactId = leadObj1.ConvertedContactId;
            li.Influence = 100;
            li.OpportunityId = leadObj1.ConvertedOpportunityId;
            li.ModelId = '03V28000000bnDrEAI';
            insert li;
            
        }
        if(leadObj1.IsConverted){
            Campaigninfluence li =new Campaigninfluence();
            li.CampaignId = '70128000001EFdg';
            li.ContactId = leadObj1.ConvertedContactId;
            li.Influence = 0;
            li.OpportunityId = leadObj1.ConvertedOpportunityId;
            li.ModelId = '03V28000000bnDrEAI';
            insert li;
        }
        
    }
}