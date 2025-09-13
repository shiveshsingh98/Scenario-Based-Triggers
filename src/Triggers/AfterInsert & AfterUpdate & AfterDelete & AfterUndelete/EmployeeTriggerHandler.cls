public static void EmployeeTriggerHandler
{
	public static void checkSalaryOnInsert(List<Employee__c> empList)
	{
		List<Tech_Firm__c> firmList=new List<Tech_Firm__c>();
		Set<Id> firmSet=new Set<Id>();
		Set<Id> techFirmSet=new Set<Id>();
		Map<Id,Decimal> maxSalMap=new Map<Id,Decimal>();
		Map<Id,Decimal> minSalMap=new Map<Id,Decimal>();
		for(Employee emp:empList)
		{
			if(emp.Tech_Firm__c!=null)
			{
				techFirmSet.add(emp.Tech_Firm__c);
			}
		}
		for(AggregateResult ar:[Select Tech_Firm__c firmId, Max(Salary__c) maxSal, Min(Salary__c) minSal from Employee__c where Tech_Firm__c IN :techFirmSet GROUP BY Tech_Firm__c])
		{
			maxSalMap.put((Id)ar.get('firmId'),(Decimal)ar.get('maxSal'));
			minSalMap.put((Id)ar.get('firmId'),(Decimal)ar.get('minSal'));
			firmSet.add((Id)ar.get('firmId'));
		}
		for(Tech_Firm__c firm:[Select Id, Max_Salary__c,Min_Salary__c from Tech_Firm__c where Id IN :firmSet])
		{
			firm.Max_Salary__c=maxSalMap.get(firm.Id);
			firm.Min_Salary__c=minSalMap.get(firm.Id);
			firmList.add(firm);
		}
		if(!firmList.isEmpty())
		{
			update firmList;
		}
	}
	
	public static void checkSalaryOnUpdate(List<Employee__c> empList,Map<Id,Employee__c> oldEmpMap)
	{
		
		List<Tech_Firm__c> firmList=new List<Tech_Firm__c>();
		Set<Id> firmSet=new Set<Id>();
		Set<Id> techFirmSet=new Set<Id>();
		Map<Id,Decimal> maxSalMap=new Map<Id,Decimal>();
		Map<Id,Decimal> minSalMap=new Map<Id,Decimal>();
		for(Employee emp:empList)
		{
			// If salary or tech firm changed, both old and new firm should be considered
            if(emp.Tech_Firm__c != null) {
                techFirmSet.add(emp.Tech_Firm__c);
            }
            if(oldEmp.Tech_Firm__c != null) {
                techFirmSet.add(oldEmp.Tech_Firm__c);
            }
		}
		for(AggregateResult ar:[Select Tech_Firm__c firmId, Max(Salary__c) maxSal, Min(Salary__c) minSal from Employee__c where Tech_Firm__c IN :techFirmSet GROUP BY Tech_Firm__c])
		{
			maxSalMap.put((Id)ar.get('firmId'),(Decimal)ar.get('maxSal'));
			minSalMap.put((Id)ar.get('firmId'),(Decimal)ar.get('minSal'));
			firmSet.add((Id)ar.get('firmId'));
		}
		for(Tech_Firm__c firm:[Select Id, Max_Salary__c,Min_Salary__c from Tech_Firm__c where Id IN :firmSet])
		{
			firm.Max_Salary__c=maxSalMap.get(firm.Id);
			firm.Min_Salary__c=minSalMap.get(firm.Id);
			firmList.add(firm);
		}
		if(!firmList.isEmpty())
		{
			update firmList;
		}
	}
	
	public static void checkSalaryOnDelete(List<Employee__c> empList)
	{
		List<Tech_Firm__c> firmList=new List<Tech_Firm__c>();
		Set<Id> firmSet=new Set<Id>();
		Set<Id> techFirmSet=new Set<Id>();
		Map<Id,Decimal> maxSalMap=new Map<Id,Decimal>();
		Map<Id,Decimal> minSalMap=new Map<Id,Decimal>();
		for(Employee emp:empList)
		{
			if(emp.Tech_Firm__c!=null)
			{
				techFirmSet.add(emp.Tech_Firm__c);
			}
		}
		for(AggregateResult ar:[Select Tech_Firm__c firmId, Max(Salary__c) maxSal, Min(Salary__c) minSal from Employee__c where Tech_Firm__c IN :techFirmSet GROUP BY Tech_Firm__c])
		{
			maxSalMap.put((Id)ar.get('firmId'),(Decimal)ar.get('maxSal'));
			minSalMap.put((Id)ar.get('firmId'),(Decimal)ar.get('minSal'));
			firmSet.add((Id)ar.get('firmId'));
		}
		for(Tech_Firm__c firm:[Select Id, Max_Salary__c,Min_Salary__c from Tech_Firm__c where Id IN :firmSet])
		{
			firm.Max_Salary__c=maxSalMap.get(firm.Id);
			firm.Min_Salary__c=minSalMap.get(firm.Id);
			firmList.add(firm);
		}
		if(!firmList.isEmpty())
		{
			update firmList;
		}
	}
}