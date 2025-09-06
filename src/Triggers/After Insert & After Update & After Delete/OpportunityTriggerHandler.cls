public class OpportunityTriggerHandler
{
	public static void addAccountRevenue(List<Opportunity> oppList)
	{
		Set<Id> accSet=new Set<Id>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null && opp.Amount!=null)
			{
				accSet.add(opp.AccountId);
			}
		}
		Map<Id,Decimal> accAmount=new Map<Id,Decimal>();
		for(AggregateResult ar:[Select Sum(Amount) amt, AccountId from Opportunity where AccountId IN :accSet GROUP BY AccountId])
		{
			accAmount.put((Id)ar.get('AccountId'),(Decimal)ar.get('amt'));
		}
		List<Account> accList=new List<Account>();
		for(Account acc:[Select Id,AnnualRevenue__c from Account where Id IN :accSet])
		{
			acc.AnnualRevenue__c=accAmount.get(acc.Id) ?? 0;
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
}