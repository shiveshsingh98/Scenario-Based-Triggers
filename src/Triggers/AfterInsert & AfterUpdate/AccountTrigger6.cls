/*
Creates the number of contacts which are equal to the number which we will enter in the Number of Locations field on the Account Object.
*/

Trigger AccountTrigger6 on Account(After Insert,After Update)
{
	if(Trigger.isAfter && Trigger.isInsert)
	{
		AccountTriggerHandler6.createConOnInsert(Trigger.new);
	}
	if(Trigger.isAfter && Trigger.isUpdate)
	{
		AccountTriggerHandler6.createConOnUpdate(Trigger.new,Trigger.oldMap);
	}
}