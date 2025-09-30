public class AccTriggerHandler9
{
	public static void preventDeletion(List<Account> accList)
	{
		Set<Id> accSet=new Set<Id>();
		Map<Id,Integer> accMap=new Map<Id,Integer>();
		for(Account acc: accList)
		{
			accSet.add(acc.Id);
		}
		for(AggregateResult ar:[Select AccountId,Count(Id) cnt from Contact where AccountId In :accSet Group By AccountId])
		{
			accMap.put((Id)ar.get('AccountId'),(Integer)ar.get('cnt'));
		}
		for(Account acc:accList)
		{
			if(accMap.get(acc.Id)>=2)
			{
				acc.addError('Account can't be deleted as it has 2 or more contacts');
			}	
		}
	}
}