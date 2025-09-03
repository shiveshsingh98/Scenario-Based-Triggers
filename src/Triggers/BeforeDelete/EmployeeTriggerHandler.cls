public class EmployeeTriggerHandler
{
	public static void checkActive(List<Employee__c> empList)
	{
		for(Employee__c emp:empList)
		{
			if(emp.Active__c==True)
			{
				emp.addError('Cannot delete the active employee');
			}
		}
	}
}