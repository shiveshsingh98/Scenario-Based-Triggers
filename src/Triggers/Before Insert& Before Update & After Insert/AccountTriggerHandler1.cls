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
	
	public static void createOpp(List<Account> accList)
	{
		List<Opportunity> oppList=new List<Opportunity>();
		for(Account acc:accList)
		{
			Opportunity opp=new Opportunity();
			opp.Name=acc.Name;
			opp.AccountId=acc.Id;
			opp.Stage='Prospecting';
			opp.CloseDate=System.today().addDays(30);
			oppList.add(opp);
		}
		if(!oppList.isEmpty)
		{
			insert oppList;
		}
	}
}