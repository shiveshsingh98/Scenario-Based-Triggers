/*
Write a trigger on Opportunity Object that updates the related OpportunityLineItem whenever the Opportunity's CloseDate is modified
*/
Trigger OpportunityTrigger8 on Opportunity(after update)
{
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		OpportunityTriggerHandler8.modifyCloseDate(Trigger.new, Trigger.oldMap);
	}
}