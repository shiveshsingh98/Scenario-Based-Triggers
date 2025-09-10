/*
A Sales Organization wants to track the largest Opportunity associated with each of its Accounts. This information could be used to prioritize sales efforts, allocate resources, or identify opportunities for cross-selling or upselling. (Field Name = maxOpp__c)
*/
Trigger OpportunityTrigger1 on Opportunity(after Insert, after Update,after delete, after undelete)
{
	if(Trigger.isAfter)
	{
		if(Trigger.isInsert || Trigger.isUndelete)
		{
			OpportunityTriggerHandler1.updAmtInsert(Trigger.new);
		}
		else if(Trigger.isUpdate)
		{
			OpportunityTriggerHandler1.updAmtUpdate(Trigger.new, Trigger.oldMap);
		}
		else if(Trigger.isDelete)
		{
			OpportunityTriggerHandler1.updAmtDelete(Trigger.old);
		}
	}
}
