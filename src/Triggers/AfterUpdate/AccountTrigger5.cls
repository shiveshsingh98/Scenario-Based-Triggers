/*
Write a trigger to update the Billing Address of all related Contacts when the Account’s billing address is updated.
*/

Trigger AccountTrigger5 on Account(After Update)
{
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler5.updateBillingAdd(Trigger.new,Trigger.oldMap);
	}
}