/*
Q1. if Account Industry is not null and having value as 'Media' then populate rating as 'Hot'. - Before Insert and Before Update
Q2. Create Opportunity when Account is created. - After Insert
*/
Trigger AccountTrigger1 on Account(before Insert, before Update,after Insert)
{
	if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate))
	{
		AccountTriggerHandler1.populateIndustry(Trigger.new);
	}
	if(Trigger.isAfter && Trigger.isInsert)
	{
		AccountTriggerHandler1.createOpp(Trigger.new);
	}
}