/*
Cognizant Apex Trigger Interview Question –
Business Use Case: Your organization sells products to its customers through opportunities. Each opportunity can have multiple products (Opportunity Line Items) associated with it. The organization wants to keep track of the total number of products sold to each account and display it on the Account record for reporting purposes.

Pre Work: Create a custom field on the Account object named Number_of_Products__c (Number) to count the total number of products related to all Opportunities associated with the Account.
*/

Trigger OpportunityLineItemTrigger2 on OpportunityLineItem(After Insert,After Delete,After Undelete)
{
	if(Trigger.isAfter)
	{
		if(Trigger.isInsert || Trigger.isUndelete )
		{
			OpportunityLineItemTriggerHandler2.insertCountOli(Trigger.new);
		}
		else if( Trigger.isDelete)
		{
			OpportunityLineItemTriggerHandler2.insertCountOli(Trigger.old);
		}
	}
}