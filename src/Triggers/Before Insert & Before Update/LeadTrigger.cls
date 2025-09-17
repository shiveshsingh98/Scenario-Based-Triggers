/*
Write an apex trigger that ensures that Email on the Lead object is unique across all the records.
*/

Trigger LeadTrigger on Lead(before Insert, before Update)
{
	if(Trigger.isBefore&&Trigger.isInsert)
	{
		LeadTriggerHandler.checkEmailInsert(Trigger.new);
	}
	else if(Trigger.isBefore&&Trigger.isUpdate)
	{
		LeadTriggerHandler.checkEmailUpdate(Trigger.new,Trigger.oldMap);
	}
}