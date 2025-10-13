/*
Write a trigger in which if an account that has related contacts and the user tries to delete that account it throws you an error "Account cannot be deleted".
*/

Trigger AccountTrigger10 on Account(before delete)
{
	if(Trigger.isBefore && Trigger.isDelete)
	{
		AccountTriggerHandler10.preventAccountDelete(Trigger.old);
	}
}