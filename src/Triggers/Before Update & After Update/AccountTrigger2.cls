/*
Q1. If Account phone is updated then put update message in description.
Q2. If Account Phone is updated then populate that on all related opportunities.
*/

Trigger AccountTrigger2 on Account(Before Update,After Update)
{
	if(Trigger.isBefore && Trigger.isUpdate)
	{
		AccountTriggerHandler2.updatePhoneMessage(Trigger.new,Trigger.oldMap);
	}
	
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler2.updateOppPhone(Trigger.new,Trigger.oldMap);
	}
}