trigger OppRestriction on Opportunity(before update)
{
	if(trigger.is before && trigger.isUpdate)
	{
		OppRestrictionHandler.addRestriction(trigger.new);
	}		
}