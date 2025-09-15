/*
Write a Trigger to calculate the total contact that the account has
*/
Trigger ContactTrigger1 on Contact(after Insert,after delete,after undelete)
{
	if(Trigger.isAfter)
	{
		if(Trigger.isInsert || Trigger.isUndelete)
		{
			ContactTriggerHandler1.handleCount(Trigger.new);
		}
		else if(Trigger.isDelete)
		{
			ContactTriggerHandler1.handleCount(Trigger.old);
		}
	}
}