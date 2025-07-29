/*
When a Contact is inserted and it’s related to an Account, then the Contact’s custom field Industry__c should be automatically populated from the Account's standard Industry field.
*/

trigger conIndustryTrigger on Contact(before Insert)
{
	if(trigger.isBefore && trigger.isInsert)
	{
		ConIndustryTriggerHandler.populateIndustry(trigger.new);
	}
}