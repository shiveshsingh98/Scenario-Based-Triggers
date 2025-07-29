public class ConIndustryTriggerHandler
{
	public static void populateIndustry(List<Contact> conList)
	{
		Set<Account> accSet=new Set<Account>();
		for(Contact con:conList)
		{
			if(con.AccountId!=null)
			{
				accSet.add(con.AccountId);
			}
		}
		Map<Id, Account> accMap=new Map<Id,Account>();
		for(Account acc:[Select Id,Contacts, Industry from Accounts where Id IN :accSet])
		{
			accMap.put(acc.Id,acc);
		}
		for(Contact c:conList)
		{
			if(c.AccountId!=null)
			{
				c.Industry__c=accMap?.get(c.AccountId).Industry;
			}
		}
	}
}