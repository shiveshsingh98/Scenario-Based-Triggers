public class AccountTriggerHandler3
{
	public static void updWebsite(List<Account> accList,Map<Id,Account> oldAccMap)
	{
		List<Contact> conList=new List<Contact>();
		Set<Id> accSet=new Set<Id>();
		Map<Id,String> accMap=new Map<Id,String>();
		for(Account acc:accList)
		{
			if(acc.Website != oldAccMap.get(acc.Id).Website)
			{
				accSet.add(acc.Id);
				accMap.put(acc.Id,acc.Website);
			}
		}
		for(Contact con:[Select Id, Website, AccountId from Contact where AccountId IN :accSet])
		{
			con.Website=accMap.get(con.AccountId);
			conList.add(con);
		}
		if(!conList.isEmpty())
		{
			update conList;
		}
}