/*
Prevent an account from deleting with Trigger, if it has 2 or more contacts.
*/

Trigger AccTrigger9 on Account(Before delete)
{
	if(Trigger.isBefore && Trigger.isDelete)
	{
		AccTriggerHandler9.preventDeletion(Trigger.old);
	}
}