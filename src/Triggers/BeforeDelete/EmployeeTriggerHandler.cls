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
	
	public static void empCount(List<Employee__c> empList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accSet=new Set<Id>();
		
		Map<Id,Integer> accEmpMap=new Map<Id,Integer>();
		for(Employee__c emp:empList)
		{
			if(emp.AccountId !=null)
			{
				accSet.add(emp.AccountId);
				
			}
		}
		for(AggregateResult arr:[Select Count(Id) cnt,AccountId from Employee__c where AccountId IN :accSet GROUP BY AccountId])
		{
			accEmpMap.put((Id)arr.get('AccountId'),(Integer)arr.get('cnt'));
		}
		for(Account acc:[SELECT Id, EmployeeCount__c FROM Account WHERE Id IN :accSet])
		{
			acc.EmployeeCount__c=accEmpMap.get(acc.id)!=null?accEmpMap.get(acc.id):0;
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
}