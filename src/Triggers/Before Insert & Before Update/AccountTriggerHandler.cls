public class AccountTriggerHandler
{
	public static void setIndustry(List<Account> accList,Map<Id,Account> oldAccMap,Boolean isInsert,Boolean isUpdate)
	{
		for(Account acc:accList)
		{
			if(isInsert &&(acc.Industry=='Banking' || acc.Industry=='Healthcare'))
			{
				acc.Rating='Hot';
			}
			else if (isUpdate && oldAccMap!=null) 
			{
				Account oldAcc=oldAccMap.get(acc.Id);
				if(oldAcc!=null && oldAcc.Industry!=acc.Industry &&(acc.Industry=='Banking' || acc.Industry=='Healthcare'))
				acc.Rating='Hot';
			}
		}
	}
}