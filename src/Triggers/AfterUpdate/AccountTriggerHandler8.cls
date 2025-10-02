public class AccountTriggerHandler8
{
	public static void changeConPhone(List<Account> accList,Map<Id,Account> accOldMap)
	{
		List<Contact> conList=new List<Contact>();
		Set<Id> accSet=new Set<Id>();
		Map<Id,String> accPhone=new Map<Id,String>();
		for(Account acc:accList)
		{
			if(acc.Phone!=accOldMap.get(acc.Id).Phone)
			{
				accSet.add(acc.Id);
				accPhone.put(acc.Id,acc.Phone);
			}	
		}
		for(Contact con:[Select Id, Phone,AccountId from Contact where AccountId IN :accSet])
		{
			con.Phone=accPhone.get(con.AccountId);
			conList.add(con);
		}
		if(!conList.isEmpty())
		{
			update conList;
		}
	}
}