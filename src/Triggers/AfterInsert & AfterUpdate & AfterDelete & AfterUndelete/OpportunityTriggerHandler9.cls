public class OpportunityTriggerHandler9
{
	public static void checkMaxOppOnInsertUndelete(List<Opportunity> opplist)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accId=new Set<Id>();
		Map<Id,Decimal> oppAccMap=new Map<Id,Decimal>();
		for(Opportunity opp:opplist)
		{
			if(opp.AccountId!=null)
			{
				accId.add(opp.AccountId);
			}
		}
		for(AggregateResult ar:[Select AccountId,MAX(Amount) max from Opportunity where AccountId IN :accId GROUP BY AccountId])
		{
			
			oppAccMap.put((Id)ar.get('AccountId'),(Decimal)ar.get('max'));
		}
		Map<Id,String> accMap=new Map<Id,String>();
		for(Opportunity opp:[Select id,AccountId, Name,Amount from Opportunity where AccountId IN :oppAccMap.keySet() AND Amount IN :oppAccMap.values()])
		{
			accMap.put(opp.AccountId,opp.Name);
		}
		for(Account acc:[Select Id,Description from Account where Id IN :accId])
		{
			acc.Description=accMap.get(acc.Id);
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
	
	public static void checkMaxOppOnDelete(List<Opportunity> opplist)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accId=new Set<Id>();
		Map<Id,Decimal> oppAccMap=new Map<Id,Decimal>();
		for(Opportunity opp:opplist)
		{
			if(opp.AccountId!=null)
			{
				accId.add(opp.AccountId);
			}
		}
		for(AggregateResult ar:[Select AccountId,MAX(Amount) max from Opportunity where AccountId IN :accId GROUP BY AccountId])
		{
			
			oppAccMap.put((Id)ar.get('AccountId'),(Decimal)ar.get('max'));
		}
		Map<Id,String> accMap=new Map<Id,String>();
		for(Opportunity opp:[Select id,AccountId, Name,Amount from Opportunity where AccountId IN :oppAccMap.keySet() AND Amount IN :oppAccMap.values()])
		{
			accMap.put(opp.AccountId,opp.Name);
		}
		for(Account acc:[Select Id,Description from Account where Id IN :accId])
		{
			acc.Description=accMap.get(acc.Id);
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
	
	public static void checkMaxOppOnUpdate(List<Opportunity> opplist,Map<Id,Opportunity> oppOldMap)
	{
		List<Account> accList=new List<Account>();
		Set<Id> accId=new Set<Id>();
		Map<Id,Decimal> oppAccMap=new Map<Id,Decimal>();
		for(Opportunity opp:opplist)
		{
			if(opp.AccountId!=null && opp.Amount!=oppOldMap.get(opp.Id).Amount)
			{
				accId.add(opp.AccountId);
			}
		}
		for(AggregateResult ar:[Select AccountId,MAX(Amount) max from Opportunity where AccountId IN :accId GROUP BY AccountId])
		{
			
			oppAccMap.put((Id)ar.get('AccountId'),(Decimal)ar.get('max'));
		}
		Map<Id,String> accMap=new Map<Id,String>();
		for(Opportunity opp:[Select id,AccountId, Name,Amount from Opportunity where AccountId IN :oppAccMap.keySet() AND Amount IN :oppAccMap.values()])
		{
			accMap.put(opp.AccountId,opp.Name);
		}
		for(Account acc:[Select Id,Description from Account where Id IN :accId])
		{
			acc.Description=accMap.get(acc.Id);
			accList.add(acc);
		}
		if(!accList.isEmpty())
		{
			update accList;
		}
	}
}