public class OpportunityTriggerHandler6
{
	public static void checkAccOpp(List<Opportunity> oppList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> oppIds=new Set<Id>();
		Set<Id> accIds=new Set<Id>();
		Map<Id,Integer> oppAccMap=new Map<Id,Integer>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null && opp.StageName=='Closed Won')
			{
				oppIds.add(opp.Id);
				accIds.add(opp.AccountId);
			}
		}
		for(AggregateResult ar:[Select Count(Id) cnt,AccountId from Opportunity where AccountId In :accIds AND StageName='Closed Won' Group BY AccountId])
		{
			oppAccMap.put((Id)ar.get('AccountId'),(Integer)ar.get('cnt'));
		}
		for(Account acc:[Select Id,Type from Account where Id IN :accIds])
		{
			if(oppAccMap.get(acc.Id)>5)
			{
				acc.Type='VIP Customer';
				accList.add(acc);
			}
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
		
	}
}