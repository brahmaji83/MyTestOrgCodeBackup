trigger TestContactMainTrigger on TestContact__c (after insert,after update) {

	if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
		TestContactTriggerHandler.createchildrecord(Trigger.New);
	}

}