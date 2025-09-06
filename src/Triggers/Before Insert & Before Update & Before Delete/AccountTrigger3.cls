/*
Update Account description on new account creation.
Update Account description if account phone is updated.
Show error when active account is deleted.
*/

Trigger AccountTrigger3 on Account(before insert,before update, before delete)
{
	if(Trigger.isInsert && Trigger.isBefore)
	{
		AccountTriggerHandler3.accDescription(Trigger.new);
	}
	if(Trigger.isBefore && Trigger.isUpdate)
	{
		AccountTriggerHandler3.accPhoneDescription(Trigger.new, Trigger.oldMap);
	}
	if(Trigger.isBefore && Trigger.isDelete)
	{
		AccountTriggerHandler3.deleteActiveAcc(Trigger.old);
	}
}