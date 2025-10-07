public class OpportunityTriggerHandler7
{
	public static void updateTotalAmount(List<Opportunity> oppList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accIds=new Set<Id>();
		Map<Id,Decimal> accMap=new Map<Id,Decimal>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null)
			{
				accIds.add(opp.AccountId);
			}
		}
		for(AggregateResult ar:[Select AccountId,Sum(Amount) amt from Opportunity where AccountId IN :accIds Group By AccountId])
		{
			accMap.put((Id)ar.get('AccountId'),(Decimal)ar.get('amt'));
		}
		for(Account acc:[Select Id,Total_Opportunity_Amount__c from Account where Id IN :accIds])
		{
			acc.Total_Opportunity_Amount__c=accMap.get(acc.Id);
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
	public static void updateTotalAmountonDelete(List<Opportunity> oppList)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accIds=new Set<Id>();
		Map<Id,Decimal> accMap=new Map<Id,Decimal>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null)
			{
				accIds.add(opp.AccountId);
			}
		}
		for(AggregateResult ar:[Select AccountId,Sum(Amount) amt from Opportunity where AccountId IN :accIds Group By AccountId])
		{
			accMap.put((Id)ar.get('AccountId'),(Decimal)ar.get('amt'));
		}
		for(Account acc:[Select Id,Total_Opportunity_Amount__c from Account where Id IN :accIds])
		{
			acc.Total_Opportunity_Amount__c=accMap.get(acc.Id);
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
	public static void updateTotalAmountonUpdate(List<Opportunity> oppList,Map<Id,Opportunity> oppMap)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accIds=new Set<Id>();
		Map<Id,Decimal> accMap=new Map<Id,Decimal>();
		for(Opportunity opp:oppList)
		{
			if(opp.AccountId!=null && opp.Amount!=oppMap.get(opp.Id).Amount)
			{
				accIds.add(opp.AccountId);
			}
		}
		for(AggregateResult ar:[Select AccountId,Sum(Amount) amt from Opportunity where AccountId IN :accIds Group By AccountId])
		{
			accMap.put((Id)ar.get('AccountId'),(Decimal)ar.get('amt'));
		}
		for(Account acc:[Select Id,Total_Opportunity_Amount__c from Account where Id IN :accIds])
		{
			acc.Total_Opportunity_Amount__c=accMap.get(acc.Id);
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
	
}