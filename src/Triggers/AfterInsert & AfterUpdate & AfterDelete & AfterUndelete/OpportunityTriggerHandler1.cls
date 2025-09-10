public class OpportunityTriggerHandler1
{
	public static void updAmtInsert(List<Opportunity> oppList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accSet=new Set<Id>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null)
			{
				accSet.add(opp.AccountId);
			}
		}
		Map<Id,Decimal> oppAmt=new Map<Id,Decimal>();
		for(AggregateResult ar:[Select AccountId,MAX(Amount) amtMax from Opportunity where AccountId IN :accSet GROUP BY AccountId])
		{
			oppAmt.put((Id)ar.get('AccountId'),(Decimal)ar.get('amtMax'));
		}
		for(Account acc:[Select Id,maxOpp__c from Account where Id IN :accSet])
		{
			acc.maxOpp__c=oppAmt.get(acc.Id) ?? 0;
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
	
	public static void updAmtUpdate(List<Opportunity> oppList,Map<Id,Opportunity> oppMap)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accSet=new Set<Id>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null && opp.Amount!=oppMap.get(opp.Id).Amount)
			{
				accSet.add(opp.AccountId);
			}
		}
		Map<Id,Decimal> oppAmt=new Map<Id,Decimal>();
		for(AggregateResult ar:[Select AccountId,MAX(Amount) amtMax from Opportunity where AccountId IN :accSet GROUP BY AccountId])
		{
			oppAmt.put((Id)ar.get('AccountId'),(Decimal)ar.get('amtMax'));
		}
		for(Account acc:[Select Id,maxOpp__c from Account where Id IN :accSet])
		{
			acc.maxOpp__c=oppAmt.get(acc.Id) ?? 0;
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
	
	public static void updAmtDelete(List<Opportunity> oppList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accSet=new Set<Id>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null)
			{
				accSet.add(opp.AccountId);
			}
		}
		Map<Id,Decimal> oppAmt=new Map<Id,Decimal>();
		for(AggregateResult ar:[Select AccountId,MAX(Amount) amtMax from Opportunity where AccountId IN :accSet GROUP BY AccountId])
		{
			oppAmt.put((Id)ar.get('AccountId'),(Decimal)ar.get('amtMax'));
		}
		for(Account acc:[Select Id,maxOpp__c from Account where Id IN :accSet])
		{
			acc.maxOpp__c=oppAmt.get(acc.Id) ?? 0;
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
}