public class ContactTriggerHandler2
{
	public static void populateOtherPhone(List<Contact> conList)
	{
		Set<Id> accIds=new Set<Id>();
		Map<Id,String> accMap=new Map<Id,String>();
		for(Contact con:conList)
		{
			if(con.AccountId!=null)
			{
				accIds.add(con.AccountId);
			}
		}
		for(Account acc:[Select Id, Name, Phone from Account where Id IN :accIds])
		{
			accMap.put(acc.Id,acc.Phone);
		}
		for(Contact con:conList)
		{
			if(con.AccountId!=null)
			{
				con.otherPhone=accMap.get(con.AccountId);
			}
		}
		
	}
}