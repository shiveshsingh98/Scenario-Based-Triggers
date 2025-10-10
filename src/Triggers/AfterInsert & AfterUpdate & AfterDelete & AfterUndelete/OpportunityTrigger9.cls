/*
Write an Apex trigger to update the Account description with opportunity name that has the Amount
*/

Trigger OpportunityTrigger9 on Opportunity(after insert, after update,after delete,after undelete)
{
	if(Trigger.isAfter &&( Trigger.isInsert || Trigger.isUndelete))
	{
		OpportunityTriggerHandler9.checkMaxOppOnInsertUndelete(Trigger.new);
	}
	else if(Trigger.isAfter && Trigger.isDelete)
	{
		OpportunityTriggerHandler9.checkMaxOppOnDelete(Trigger.old);
	}
	else If(Trigger.isAfter && Trigger.isUpdate)
	{
		OpportunityTriggerHandler9.checkMaxOppOnUpdate(Trigger.new,Trigger.oldMap);
	}
}