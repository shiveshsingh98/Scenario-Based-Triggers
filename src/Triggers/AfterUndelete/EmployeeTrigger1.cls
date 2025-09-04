/*
Undelete Employee Record and set Active as True
*/

Trigger EmployeeTrigger1 on Employee(after undelete)
{
	if(Trigger.isAfter && Trigger.isUndelete)
	{
		EmployeeTriggerHandler1.setActive(Trigger.new);
	}
}