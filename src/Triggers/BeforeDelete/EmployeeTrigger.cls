/*
Q1. Employee record cannot be deleted if active is true.
Q2. When Employee record is deleted then update Left Employee Count on Account.
*/

Trigger EmployeeTrigger on Employee (before delete,after delete)
{
	if(Trigger.isBefore && Trigger.isDelete)
	{
		EmployeeTriggerHandler.checkActive(Trigger.old);
	}
	if(Trigger.isAfter && Trigger.isDelete)
	{
		EmployeeTriggerHandler.empCount(Trigger.old);
	}
}