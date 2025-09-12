public class OpportunityLineItemTriggerHandler2
{
	public static void insertCountOli(List<OpportunityLineItem> oliList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> oppList=new Set<Id>();
		Set<Id> accSet=new Set<Id>();
		Map<Id,Integer> oliCount=new Map<Id,Integer>();
		for(OpportunityLineItem oli:oliList)
		{
			oppList.add(oli.OpportunityId);
		}

		for(AggregateResult ar:[Select Count(Id) totalCount, Opportunity.AccountId accId from OpportunityLineItem where OpportunityId IN:oppList GROUP BY Opportunity.AccountId])
		{
			oliCount.put((Id)ar.get('accId'), (Integer)ar.get('totalCount'));
			accSet.add((Id)ar.get('accId'));
		}
				
		for(Account acc:[Select Id,Number_of_Products__c from Account where Id IN :accSet])
		{
			acc.Number_of_Products__c=oliCount.get(acc.Id);
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
}