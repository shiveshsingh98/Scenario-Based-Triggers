/*
whenever a Opportunity reaches closed state i.e. closed won or closed lost, then no one should be able to edit that object except the manager of current opportunity owner, the owner and the System admin
*/

trigger OppRestriction on Opportunity(before update)
{
	if(trigger.is before && trigger.isUpdate)
	{
		OppRestrictionHandler.addRestriction(trigger.new);
	}		
}