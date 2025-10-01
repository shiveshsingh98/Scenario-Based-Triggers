/*
Write a trigger to update City field in all related Opportunity, when City field is updated in Account.
*/

Trigger AccountTrigger7 on Account(After Update)
{
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler7.changeCity(Trigger.new, Trigger.oldMap);
	}
}