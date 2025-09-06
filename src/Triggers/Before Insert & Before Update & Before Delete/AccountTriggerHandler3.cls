public class AccountTriggerHandler3
{
	public static void accDescription(List<Account> accList)
	{
		for(Account acc:accList)
		{
			acc.Description='Account has been created';
		}
	}
	public static void accPhoneDescription(List<Account> accList,Map<Id,Account> accMap)
	{
		for(Account acc:accList)
		{
			if(acc.Phone!=accMap.get(acc.Id).Phone)
			{
				acc.Description='Phone is updated';
			}
		}
	}
	public static void deleteActiveAcc(List<Account> accList)
	{
		for(Account acc:accList)
		{
			if(acc.Active__c==True)
			{
				acc.addError('Active Account can't be deleted');
			}
		}
	}
}