public class AccountTriggerHandler4
{
	public static void createCon(List<Account> accList)
	{
		List<Contact> conList=new List<Contact>();
		for(Account acc:accList)
		{
			if(acc.Industry=='Banking')
			{
				Contact con=new Contact();
				con.AccountId=acc.Id;
				con.Lastname=acc.Name;
				con.Phone=acc.Phone;
				conList.add(con);
			}
		}
		if(!conList.isEmpty())
		{
			insert conList;
		}
	}
}