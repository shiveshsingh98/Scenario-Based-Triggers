/*
Do not allow a user  to modify the Lead record if the Lead is created before 8 days from today.
*/

Trigger LeadTrigger on Lead(Before Update)
{
	if(Trigger.isBefore && Trigger.isUpdate)
	{
		LeadTriggerHandler.noModify(Trigger.new);
	}
}