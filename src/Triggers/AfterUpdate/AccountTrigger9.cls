/*
When a child Account’s Industry changes, update the parent Account’s Industry to match the child’s new Industry.
*/

Trigger AccountTrigger9 on Account(After update)
{
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler9.matchIndustry(Trigger.new,Trigger.oldMap);
	}
}