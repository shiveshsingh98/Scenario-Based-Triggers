/*
Write an Apex trigger on the Opportunity object that performs two different actions based on whether the record is inserted or updated. When a new Opportunity is inserted with an Amount greater than 10,000, the trigger should automatically create a Task with the subject “Follow up on new high-value opportunity,” priority set to High, status as Not Started, and the due date set to tomorrow. Additionally, when an existing Opportunity is updated and the Amount field is changed to a value greater than 10,000, another Task should be created with the subject “Re-check updated high-value opportunity,” along with the same values for priority, status, and due date.
*/

Trigger OpportunityTrigger5 on Opportunity(After Insert, After Update)
{
	if(Trigger.isAfter)
	{
		if(Trigger.isInsert)
		{
			OpportunityTriggerHandler5.createTaskOnOppInsert(Trigger.new);
		}
		else if(Trigger.isUpdate)
		{
			OpportunityTriggerHandler5.createTaskOnOppUpdate(Trigger.new,Trigger.oldMap);
		}
	}
}