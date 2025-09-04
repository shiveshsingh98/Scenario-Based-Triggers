Public class EmployeeTriggerHandler1
{
	public static void setActive(List<Employee__c> empList)
	{
		List<Employee__c> employeeList=new List<Employee__c>();
		Set<Id> accSet=new Set<Id>();
		for(Employee__c emp:empList)
		{
			if(emp.Active==false)
			{
				emp.Active=true;
				employeeList.add(emp);
			}
			if(emp.AccountId!=null)
			{
				accSet.add(emp.AccountId);
			}
		}
			
		if(!employeeList.isEmpty())
		{
			update employeeList;
		}
		Map<Id,Integer> accMap=new Map<Id,Integer>();
		for(AggregateResult ar:[Select AccountId,Count(Id) cnt from Employee__c Where AccountId In :accSet GROUP BY AccountId])
		{
			accMap.put((Id)ar.get('AccountId'),(Integer)ar.get('cnt'));
		}
		List<Account> accList=new List<Account>();
		for(Account acc:[Select Id,EmployeeCount__c from Account where Id IN :accSet])
		{
			acc.EmployeeCount__c=accMap.get(acc.Id)?? 0; //Null Coalescing Operator- returns its right-hand side operand when its left-hand side operand is null
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
}