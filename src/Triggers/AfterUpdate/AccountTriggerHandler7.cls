public class AccountTriggerHandler7
{
	public static void changeCity(List<Account> accList,Map<Id,Account> accOldMap)
	{
		List<Opportunity> oppList=new List<Opportunity>();
		Set<Id> accSet=new Set<Id>();
		Map<Id,String> accCity=new Map<Id,String>();
		for(Account acc:accList)
		{
			if(acc.BillingCity!=accOldMap.get(acc.Id).BillingCity)
			{
				accSet.add(acc.Id);
				accCity.put(acc.Id,acc.BillingCity);
			}
			
		}
		for(Opportunity opp:[Select Id, City__c,AccountId from Opportunity where AccountId In :accSet])
		{
			opp.City__c=accCity.get(opp.AccountId);
			oppList.add(opp);
		}
		if(!oppList.isEmpty())
		{
			update oppList;
		}
	}
}