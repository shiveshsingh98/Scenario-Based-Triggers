/*
Whenever an Opportunity is inserted,updated, or deleted,update the parent Account's custom field Total_Opportunity_Amount__c with the sum of all related Opportunities' Amounts.
*/

Trigger OpportunityTrigger7 on Opportunity(after insert,after update, after delete,after undelete)
{
	if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUndelete))
	{
		OpportunityTriggerHandler7.updateTotalAmount(Trigger.new);
	}
	else if(Trigger.isAfter && Trigger.isDelete)
	{
		OpportunityTriggerHandler7.updateTotalAmountonDelete(Trigger.old);
	}
	else if(Trigger.isAfter && Trigger.isUpdate)
	{
		OpportunityTriggerHandler7.updateTotalAmountonUpdate(Trigger.new,Trigger.oldMap);
	}
	
}