/*
Your Company wants to ensure that the shipping address of an Account record is always in sync with the billing address
*/
Trigger AccountTrigger8 on Account(before Insert, before Update)
{
	if(Trigger.isBefore)
	{
		if(Trigger.isInsert)
		{
			AccountTriggerHandler8.syncAddress(Trigger.new);
		}
		else if(Trigger.isUpdate)
		{
			AccountTriggerHandler8.syncAddressOnUpdate(Trigger.new,Trigger.oldMap);
		}
	}
}