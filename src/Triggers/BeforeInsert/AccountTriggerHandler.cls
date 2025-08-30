public class AccountTriggerHandler
{
	public static void setIndustry(List<Account> accList)
	{
		for(Account acc:accList)
		{
			if(acc.Industry=='Banking' || acc.Industry=='Healthcare')
			{
				acc.Rating='Hot';
			}
			
		}
	}
}