/*
Suppose you are a sales manager for a company that sells products to other businesses. Your team uses Salesforce to manage customer accounts and contacts, and you want to ensure that all contacts associated with a particular account have the same phone number as the account.
*/

Trigger AccountTrigger8 on Account(After Update)
{
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler8.changeConPhone(Trigger.new,Trigger.oldMap);
	}
}