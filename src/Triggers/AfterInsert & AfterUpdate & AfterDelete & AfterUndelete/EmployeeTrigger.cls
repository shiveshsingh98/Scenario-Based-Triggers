/*
Business Use Case: Your Company ABC Corp. wants to keep track of the highest and lowest salaries paid by each of its tech firms to gain insights into how salaries are distributed across different parts of the organization and take appropriate actions to ensure that employee salaries are fair and equitable.

Pre Work:  You need to create 2 Custom Objects . Object – 1 : Tech_Firm__c Fields : Max_Salary__c (Currency) , Min_Salary__c (Currency)

Object – 2 : Employee__c Fields : Salary__c (Currency) , Tech_Firm__c (Lookup)
*/
Trigger EmployeeTrigger on Employee__c(after insert,after update, after delete,after undelete)
{
	if(Trigger.isAfter)
	{
		if(Trigger.isInsert || Trigger.isUndelete)
		{
			EmployeeTriggerHandler.checkSalaryOnInsert(Trigger.new);
		}
		else if(Trigger.isUpdate)
		{
			EmployeeTriggerHandler.checkSalaryOnUpdate(Trigger.new,Trigger.oldMap);
		}
		else if(Trigger.isDelete)
		{
			EmployeeTriggerHandler.checkSalaryOnDelete(Trigger.old);
		}
	}
}