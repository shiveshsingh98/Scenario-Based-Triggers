/*
When ever Opportunity "Stage" is modified to "Closed Won" then set "Close Date" as "Today Date" and "Type" as "New Customer".
*/
Trigger OpportunityTrigger4 on Opportunity(Before Update)
{
	if(Trigger.isBefore && Trigger.isUpdate)
	{
		OpportunityTriggerHandler4.checkStage(Trigger.new,Trigger.oldMap);
	}
}