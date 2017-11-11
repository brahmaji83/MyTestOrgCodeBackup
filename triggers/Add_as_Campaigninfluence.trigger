trigger Add_as_Campaigninfluence on Lead ( After update)  {
    map <Opportunity,Id> OppsAndContacts = new map <Opportunity,Id>(); 
    Campaigninfluence[] C = new list<Campaigninfluence>();
    //List <CampaignMember> cmm =[SELECT CampaignId FROM CampaignMember WHERE ContactId = :l.convertedcontactid ORDER BY CreatedDate ASC NULLS FIRST];
    Integer i=0;
    for (Lead l : Trigger.new) {
        system.debug(l.IsConverted);
        If(l.IsConverted){ 
            Opportunity Opp = [SELECT Id from Opportunity where Id = :l.convertedopportunityid];
            OppsAndContacts.put(Opp, l.ConvertedContactID);
        }
        system.debug('converted contact id '+l.convertedcontactid);
        List <CampaignMember> cmm =[SELECT CampaignId FROM CampaignMember 
                                    WHERE ContactId = :l.convertedcontactid ORDER BY CreatedDate ASC NULLS FIRST];
        for(CampaignMember ii:cmm)
        {
            if(i==0)
            {
                Campaigninfluence ci =new Campaigninfluence();
                ci.CampaignId =ii.CampaignId;
                ci.ContactId=l.convertedcontactid;
                system.debug('Opporty id '+l.convertedopportunityid);
                ci.OpportunityId=l.convertedopportunityid;
                ci.ModelId='03V28000000bnDrEAI';
                ci.Influence=100;
                i++;
                c.add(ci);
                
            }
            
            else{
                Campaigninfluence ci1 =new Campaigninfluence();
                ci1.CampaignId =ii.CampaignId;
                ci1.ContactId=l.convertedcontactid;
                ci1.OpportunityId=l.convertedopportunityid;
                ci1.ModelId='03V28000000bnDrEAI';
                ci1.Influence=0;
                c.add(ci1);
                
            }
        }
    }
    if(c.size() >0)
    insert c;
}