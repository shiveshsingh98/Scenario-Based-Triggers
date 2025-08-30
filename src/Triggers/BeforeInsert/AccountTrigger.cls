/*
Account trigger to set Account rating as 'Hot', if account industry is 'Banking' or 'Healthcare'
*/
Trigger AccountTrigger on Account(before Insert, before Update)
{
	if(Trigger.isBefore &&(Trigger.isInsert || Trigger.isUpdate))
	{
		AccountTriggerHandler.setIndustry(Trigger.new);
	}
}