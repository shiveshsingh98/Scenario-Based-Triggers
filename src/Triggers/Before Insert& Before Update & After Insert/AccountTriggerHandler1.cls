public class AccountTriggerHandler1
{
	public static void populateIndustry(List<Account> accList)
	{
		for(Account acc:accList)
		{
			if(acc.Industry!=null && acc.Industry=='Media)
			{
				acc.Rating='Hot';
			}
		}
	}
}