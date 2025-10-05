public class AccountTriggerHandler9
{
	public static void matchIndustry(List<Account> accList,Map<Id,Account> oldAccMap)
	{
		List<Account> parentAcc=new List<Account>();
		Set<Id> parentAccSet=new Set<Id>();
		Map<Id,String> industryMap=new Map<Id,String>();
		for(Account acc:accList)
		{
			if(acc.ParentId!=null && acc.Industry!=null && acc.Industry!=oldAccMap.get(acc.Id).Industry)
			{
				parentAccSet.add(acc.ParentId);
				industryMap.put(acc.ParentId,acc.Industry);
			}
		}
		for(Account acc:[Select Id,Industry from Account where Id IN :parentAccSet])
		{
			acc.Industry=industryMap.get(acc.Id);
			parentAcc.add(acc);
		}
		if(!parentAcc.isEmpty())
		{
			update parentAcc;
		}
	}
}