/*
Prevent an Opportunity from being closed, if its related case is still open.
*/

Trigger OpportunityTrigger3 on Opportunity(before Update)
{
	if(Trigger.isBefore && Trigger.isUpdate)
	{
		OpportunityTriggerHandler3.closeError(Trigger.new,Trigger.oldMap);
	}
}