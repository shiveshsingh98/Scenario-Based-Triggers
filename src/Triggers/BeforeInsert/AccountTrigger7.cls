/*
The following Trigger will fires when we try to create the account with same name i.e. Preventing the users to create Duplicate Accounts
*/

Trigger AccountTrigger7 on Account(Before Insert)
{
	if(Trigger.isBefore && Trigger.isInsert)
	{
		AccountTriggerHandler7.checkDuplicate(Trigger.new);
	}
}