trigger ShareRowSpanRecord on RowSpan__c (after insert, after update) {
	
    //Share the record
    List<RowSpan__Share> newShareRecords = new List<RowSpan__Share>();
    List<RowSpan__Share> delShareRecords = new List<RowSpan__Share>();
    if(Trigger.IsInsert)
    {
        for(RowSpan__c rs : Trigger.New){
            system.debug('sales id '+rs.Sales_Person__c);
            if(rs.Sales_Person__c != null){
                RowSpan__Share rsShare = new RowSpan__Share();
                rsShare.ParentId = rs.Id;
                rsShare.RowCause = Schema.RowSpan__Share.RowCause.Share_a_record_for_particular_user__c;
                rsShare.AccessLevel = 'Read';
                rsShare.UserOrGroupId = rs.Sales_Person__c;
                newShareRecords.add(rsShare);
                system.debug('entered in insert loop');
            }
        }
        insert newShareRecords;
    }
    
    if(Trigger.IsUpdate){
        Map<Id, List<RowSpan__Share>> sharedmap = new Map<Id, List<RowSpan__Share>>();
        List<RowSpan__Share> rsshareList = new List<RowSpan__Share>();
        List<RowSpan__Share> deletelist = new List<RowSpan__Share>();
        for(RowSpan__Share r: [select Id,ParentId from RowSpan__Share where ParentId in : Trigger.New 
                              and RowCause != 'Owner']){           
            if(sharedmap.containsKey(r.ParentId))
            {
                rsshareList = sharedmap.get(r.ParentId);
                rsshareList.add(r);
                sharedmap.put(r.ParentId, rsshareList);
            }
            else{
                rsshareList.add(r);
                sharedmap.put(r.ParentId, rsshareList);
            }
        }
        
        for(RowSpan__c rs : Trigger.New){
            system.debug('sales id '+rs.Sales_Person__c);
            if(rs.Sales_Person__c != Trigger.OldMap.get(rs.Id).Sales_Person__c){                
                RowSpan__Share rsShare = new RowSpan__Share();
                rsShare.ParentId = rs.Id;
                rsShare.RowCause = Schema.RowSpan__Share.RowCause.Share_a_record_for_particular_user__c;
                rsShare.AccessLevel = 'Read';
                rsShare.UserOrGroupId = rs.Sales_Person__c;
                newShareRecords.add(rsShare);
                if(sharedmap.size() > 0)
                	deletelist.addAll(sharedmap.get(rs.Id));                
            }
        }
        if(!deletelist.isEmpty())
        	delete deletelist;
        insert newShareRecords;
    }
}