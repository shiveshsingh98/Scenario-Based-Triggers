/*
Q1. Employee record cannot be deleted if active is true.
Q2. When Employee record is deleted then update Left Employee Count on Account.
*/

Trigger EmployeeTrigger on Employee (before delete)
{
	if(Trigger.isBefore && Trigger.isDelete)
	{
		EmployeeTriggerHandler.checkActive(Trigger.old);
	}
}