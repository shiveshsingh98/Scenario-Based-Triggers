/*
On Opportunity creation if amount is not null then add amount to account annual revenue
When Opportunity Amount updates then update Account annual revenue too.
When Opportunity is deleted then update Account Annual Revenue.
*/
Trigger OpportunityTrigger on Opportunity(After Insert,After Update,After Delete)
{
	if(Trigger.isAfter && Trigger.isInsert)
	{
		OpportunityTriggerHandler.addAccountRevenue(Trigger.new);
	}
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		OpportunityTriggerHandler.updateAccRevenue(Trigger.new,Trigger.oldMap);
	}
	if(Trigger.isAfter && Trigger.isDelete)
	{
		OpportunityTriggerHandler.delUpdateAccRevenue(Trigger.old);
	}
}