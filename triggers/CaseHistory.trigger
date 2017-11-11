trigger CaseHistory on Case (after insert) {

List<CaseTeamMember> lstCTM = new List<CaseTeamMember>();
for(Case eachCase: trigger.new){
    CaseTeamMember ctm = new CaseTeamMember();
    ctm.MemberId = eachCase.OwnerId;
    ctm.ParentId = eachCase.Id;
    ctm.TeamRoleId = '0B728000000fxeR';
    lstCTM.add(ctm);
}
insert lstCTM;

/*
    public string coldtype; 
    public string cnewtype;
    public case cd ;
    for(case c: Trigger.old){
        coldtype = c.Type;
    }
    
    for(case c: Trigger.New){
        cnewtype = c.Type;
        c.Description= c.Description+'old value '+coldtype+' new value '+cnewtype;
    }
    
    if(coldtype=='Mechanical'){
        if(cnewtype=='Other'){
            //Trigger.oldmap.get(0).addError('test');
        }
    }
    */
}