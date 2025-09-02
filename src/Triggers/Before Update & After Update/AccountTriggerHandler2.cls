public class AccountTriggerHandler2
{
	public static void updatePhoneMessage(List<Account> accList, Map<Id,Account> oldaccMap)
	{
		for(Account acc:accList)
		{
			if(acc.Phone!=oldaccMap.get(acc.Id).Phone)
			{
				if(String.isBlank(acc.Description)
				{
					acc.Description='Phone is Updated on '+System.today();
				}
				else
				{
					acc.Description+='\n Phone is Updated on '+System.today();
				}
			}
		}
	}
	
	public static void updateOppPhone(List<Account> accList, Map<Id,Account> oldaccMap)
	{
		List<Opportunity> oppList=new List<Opportunity>();

		Map<Id,String> accMap=new Map<Id,String>();
		for(Account acc:accList)
		{
			if(acc.Phone!=oldaccMap.get(acc.Id).Phone)
			{
				accMap.put(acc.Id,acc.Phone);
			}
			
		}

		for(Opportunity opp:[Select Id,AccountId,Phone from Opportunity where AccountId IN :accMap.keySet())
		{
			opp.Phone=accMap.get(opp.AccountId).Phone;
			oppList.add(opp);
		}
		
		if(!oppList.isEmpty())
		{
			update oppList;
		}
	}
}