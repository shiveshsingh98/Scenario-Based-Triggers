/*
When an Account has more than 5 closed won Opportunities, update its Type to “VIP Customer”.
*/

Trigger OpportunityTrigger6 on Opportunity(After Insert)
{
	if(Trigger.isAfter && Trigger.isInsert)
	{
		OpportunityTriggerHandler6.checkAccOpp(Trigger.new);
	}
}